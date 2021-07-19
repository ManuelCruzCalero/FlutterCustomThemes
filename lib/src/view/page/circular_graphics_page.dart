import 'package:custom_themes/src/view/widget/radial_progress_widget.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class CircularGraphicsPage extends StatefulWidget {
  @override
  _CircularGraphicsPageState createState() => _CircularGraphicsPageState();
}

class _CircularGraphicsPageState extends State<CircularGraphicsPage> {
  double percent = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Page Circular Progress',
          style: GoogleFonts.comicNeue(),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            _CustomRadialProgress(
              percent: percent,
              color: Colors.green,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _CustomRadialProgress(
                  percent: percent,
                  color: Colors.yellow,
                ),
                _CustomRadialProgress(
                  percent: percent,
                  color: Colors.brown,
                ),
              ],
            ),
            _CustomRadialProgress(
              percent: percent,
              color: Colors.red,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          percent += 5;
          if (percent > 100) {
            percent = 0;
          }

          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _CustomRadialProgress extends StatelessWidget {
  const _CustomRadialProgress({
    @required this.percent,
    @required this.color,
  });

  final double percent;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: RadialProgressWidget(
        percent: percent,
        colorArc: color,
        sizePencilCircle: 12,
        sizeFont: 45,
      ),
    );
  }
}
