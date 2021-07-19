import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RadialProgressWidget extends StatefulWidget {
  final double percent;
  final Color colorArc;
  final Color colorCircle;
  final double sizePencilCircle, sizePencilArc, sizeFont;
  RadialProgressWidget({
    @required this.percent,
    this.colorArc = Colors.red,
    this.colorCircle = Colors.grey,
    this.sizePencilCircle = 3,
    this.sizePencilArc = 10,
    this.sizeFont = 50,
  });

  @override
  _RadialProgressWidgetState createState() => _RadialProgressWidgetState();
}

class _RadialProgressWidgetState extends State<RadialProgressWidget>
    with SingleTickerProviderStateMixin {
  double lastPercent;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    lastPercent = widget.percent;
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final differenceAnimate = widget.percent - lastPercent;

    lastPercent = widget.percent;
    controller.forward(from: 0.0);

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(10),
          child: CustomPaint(
            child: Center(
              child: Text(
                '${((widget.percent - differenceAnimate) + (differenceAnimate * controller.value)).toInt()} %',
                style: GoogleFonts.comicNeue(
                  textStyle: TextStyle(
                    fontSize: widget.sizeFont,
                    color: widget.colorArc,
                  ),
                ),
              ),
            ),
            painter: _MyRadialProgress(
              (widget.percent - differenceAnimate) +
                  (differenceAnimate * controller.value),
              widget.colorArc,
              widget.colorCircle,
              widget.sizePencilCircle,
              widget.sizePencilArc,
            ),
          ),
        );
      },
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  final porcentaje;
  final colorArc;
  final colorCircle;
  final sizePencilCircle;
  final sizePencilArc;

  _MyRadialProgress(
    this.porcentaje,
    this.colorArc,
    this.colorCircle,
    this.sizePencilCircle,
    this.sizePencilArc,
  );

  // Method that draw the CustomPaint
  @override
  void paint(Canvas canvas, Size size) {
    // Circle
    // Create brush to draw the circle
    Paint pencil =
        _paintBrush(sizePencilCircle, colorCircle, PaintingStyle.stroke);

    // position(x,y)
    Offset center = new Offset(size.width / 2, size.height / 2);

    // radius
    double radius = min(size.width / 2, size.height / 2);

    // Draw the Circular
    // c      --> position
    // radius --> circle radius
    // paint  --> Object paint(pencil to draw)
    canvas.drawCircle(center, radius, pencil);

    // Arc
    // Create brush to draw the arc
    final pencilArc =
        _paintBrush(sizePencilArc, colorArc, PaintingStyle.stroke);

    // Part of the filling
    // 2*pi --> full turn
    double arcAngle = 2 * pi * (porcentaje / 100);

    // Draw arc
    // rect       --> space where to place the arc, have as arguments center and radius of the circle
    // StartAngle --> initial angle
    // SweepAngle --> filling angle
    // UseCenter  --> bool
    // Paint      --> Object paint(pencil to draw)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      pencilArc,
    );
  }

  // Method to create pencil
  Paint _paintBrush(double strokeWidth, Color color, PaintingStyle style) {
    final pencil = new Paint()
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..color = color
      ..style = style;
    return pencil;
  }

  // Method that allows repainting and animations
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
