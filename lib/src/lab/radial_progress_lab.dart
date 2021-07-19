import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class CircularGraphicsPage extends StatefulWidget {
  @override
  _CircularGraphicsPageState createState() => _CircularGraphicsPageState();
}

// SingleTickerProviderStateMixin --> Synchronized to the frames, it can reproduce the screen
class _CircularGraphicsPageState extends State<CircularGraphicsPage>
    with SingleTickerProviderStateMixin {
  double percent = 0.0;
  double newPercent = 0.0;
  Color color = Colors.red;
  TextStyle font = GoogleFonts.comicNeue();

  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));

    controller.addListener(() {
      // print('Valor del controller $controller.value');
      setState(() {
        // interpolation of two numbers
        // a --> percent
        // b --> newPercent
        // t --> time, duration
        percent = lerpDouble(percent, newPercent, controller.value);
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    IconData icono = Icons.refresh;
    int percentText = percent.toInt();

    return Scaffold(
      appBar: AppBar(
        title: Text('Page Circular Progress', style: font),
        centerTitle: true,
      ),
      //
      body: Center(
        child: Container(
          padding: EdgeInsets.all(6),
          width: 300,
          height: 300,
          child: CustomPaint(
            child: Center(
              child: Text(
                '$percentText %',
                style: GoogleFonts.comicNeue(
                  textStyle: TextStyle(
                    fontSize: 50,
                    color: color,
                  ),
                ),
              ),
            ),
            painter: _MyRadialProgress(percent, color),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          percent = newPercent;
          newPercent += 5;
          if (newPercent > 100) {
            newPercent = 0;
            percent = 0;
          }

          // shoot the animation
          // Use the argument from with values between 0 and 1 for indicate from point where we want the animation to start
          controller.forward(from: 0.0);

          setState(() {});
        },
        child: Icon(icono),
        backgroundColor: color,
      ),
    ); // return _MyProgressRadius(progress: 70, primaryColor: Colors.black, secondaryColor:Colors.cyan, widthLinePrimary:10, widthLineSecondary:0.5);
  }
}

class _MyRadialProgress extends CustomPainter {
  final porcentaje;
  final color;

  _MyRadialProgress(this.porcentaje, this.color);

  // Method that draw the CustomPaint
  @override
  void paint(Canvas canvas, Size size) {
    // Circle
    // Create brush to draw the circle
    Paint pencil = _paintBrush(3, Colors.black54, PaintingStyle.stroke);

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
    final pencilArc = _paintBrush(10, color, PaintingStyle.stroke);

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
      ..color = color
      ..style = style;
    return pencil;
  }

  // Method that allows repainting and animations
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
