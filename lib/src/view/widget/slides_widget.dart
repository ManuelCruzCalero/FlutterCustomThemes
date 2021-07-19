import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'dots_widget.dart';

import 'package:custom_themes/src/model/slider_model.dart';
import 'package:custom_themes/src/model/slideshow_model.dart';

class SlideshowCompletedWidget extends StatelessWidget {
  final List<Widget> slides;
  final bool topPosition;
  final Color primaryColor, secondaryColor;
  final double primarySize, secondarySize;

  const SlideshowCompletedWidget({
    @required this.slides,
    this.topPosition = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.blueGrey,
    this.primarySize = 17,
    this.secondarySize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => SliderModel(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => SlideshowModel(),
        ),
      ],
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<SlideshowModel>(context).primaryColor = this.primaryColor;
              Provider.of<SlideshowModel>(context).secondaryColor = this.secondaryColor;
              Provider.of<SlideshowModel>(context).primarySize = this.primarySize;
              Provider.of<SlideshowModel>(context).secondarySize = this.secondarySize;
              return _StrucutreSlideshow(
                topPosition: topPosition,
                slides: slides,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _StrucutreSlideshow extends StatelessWidget {
  final bool topPosition;
  final List<Widget> slides;

  const _StrucutreSlideshow({
    @required this.topPosition,
    @required this.slides,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.topPosition)
          DotsWidget(
            this.slides.length,
          ),
        Expanded(
          child: _Slides(this.slides),
        ),
        if (!this.topPosition)
          DotsWidget(
            this.slides.length,
          ),
      ],
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final PageController pageViewController = new PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      // Whenever Porvider is used in the initState, it forces us to put listen false
      // Update SlideModel status
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
          controller: pageViewController,
          physics: BouncingScrollPhysics(),
          children: widget.slides.map((slide) => _Slide(slide)).toList()),
    );
  }
}

//
class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide(
    this.slide,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}
