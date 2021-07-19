import 'package:flutter/material.dart';

import 'package:custom_themes/src/view/widget/menu_drawer_widget.dart';
import 'package:custom_themes/src/view/widget/lista_opciones_widget.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App con diseños en Flutter"),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: MenuDrawerWidget(),
      body: ListaOpcionesWidget(),
    );
  }
}
