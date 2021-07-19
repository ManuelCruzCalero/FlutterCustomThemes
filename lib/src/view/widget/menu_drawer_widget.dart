import 'package:flutter/material.dart';

import 'package:line_icons/line_icons.dart';

import 'lista_opciones_widget.dart';

class MenuDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                width: double.infinity,
                height: 150,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    'MC',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListaOpcionesWidget(),
            ),
            ListTile(
              leading: Icon(LineIcons.lightbulb, color: Colors.blue),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: true,
                onChanged: (value) {},
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.add_to_home_screen,
                color: Colors.blue,
              ),
              title: Text('Custom Theme'),
              trailing: Switch.adaptive(
                value: true,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
