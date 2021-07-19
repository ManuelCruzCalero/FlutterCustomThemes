import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:custom_themes/src/view/widget/slides_widget.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SlideShow Page',
          style: GoogleFonts.comicNeue(),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: _MyCustomSlideshow()),
          Expanded(child: _MyCustomSlideshow()),
        ],
      ),
    );
  }
}

class _MyCustomSlideshow extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SlideshowCompletedWidget(
      primaryColor: Colors.lightGreenAccent,
      primarySize: 20,
      secondarySize: 10,
      slides: [
        SvgPicture.asset('assets/img/slide-01.svg'),
        SvgPicture.asset('assets/img/slide-02.svg'),
        SvgPicture.asset('assets/img/slide-03.svg'),
        SvgPicture.asset('assets/img/slide-04.svg'),
        SvgPicture.asset('assets/img/slide-05.svg'),
        SvgPicture.asset('assets/img/slide-06.svg'),
        SvgPicture.asset('assets/img/slide-07.svg'),
      ],
    );
  }
}
