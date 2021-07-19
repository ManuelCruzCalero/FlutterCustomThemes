import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ListaOpcionesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color colorIcon = Colors.blue;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: 20,
      separatorBuilder: (context, i) => Divider(
        color: Colors.blue,
      ),
      itemBuilder: (context, i) => ListTile(
        // leading --> Widget del inicio
        leading: Icon(LineIcons.slideshare, color: colorIcon),
        title: Text('Lista con separador'),
        // trailing --> icono del final del final
        trailing: Icon(LineIcons.chevronRight, color: colorIcon),
        onTap: () {},
      ),
    );
  }
}
