import 'package:flutter/material.dart';

import 'package:settings/src/shared/prefs_usuario.dart';

import 'package:settings/src/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = PrefsUsuario();

  @override
  Widget build(BuildContext context) {
    this.prefs.lastPage = HomePage.routeName;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Preferencias de Usuario'),
          backgroundColor: (this.prefs.color) ? Colors.purple : Colors.blue,
        ),
        drawer: WDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Color Secundario: ${this.prefs.color}'),
            Divider(),
            Text('Género: ${this.prefs.genero}'),
            Divider(),
            Text('Nombre Usuario: ${this.prefs.nombreUser}'),
            Divider(),
          ],
        ),
      ),
    );
  }
}