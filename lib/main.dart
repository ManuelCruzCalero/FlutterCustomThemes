import 'package:flutter/material.dart';

import 'src/view/page/slideshow_page.dart';

// import 'package:custom_themes/src/view/page/circular_graphics_page.dart';
// import 'src/view/page/launcher_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Temas personalizados',
      home: SlideShowPage(),
    );
  }
}
