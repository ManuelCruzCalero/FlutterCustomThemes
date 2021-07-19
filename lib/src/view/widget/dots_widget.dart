import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:custom_themes/src/model/slider_model.dart';
import 'package:custom_themes/src/model/slideshow_model.dart';

class DotsWidget extends StatelessWidget {
  final int numberDots;

  DotsWidget(
    this.numberDots,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 50,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              this.numberDots,
              (index) => _Dot(
                index,
              ),
            )));
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    final customSSModel = Provider.of<SlideshowModel>(context);
    final bool _condition =
        pageViewIndex >= index - 0.5 && pageViewIndex <= index + 0.5;

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: (_condition)
          ? customSSModel.primarySize
          : customSSModel.secondarySize,
      height: (_condition)
          ? customSSModel.primarySize
          : customSSModel.secondarySize,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (_condition)
            ? customSSModel.primaryColor
            : customSSModel.secondaryColor,
      ),
    );
  }
}
