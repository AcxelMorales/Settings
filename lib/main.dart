import 'package:flutter/material.dart';

import 'package:settings/src/pages/home_page.dart';
import 'package:settings/src/pages/settings_page.dart';

import 'package:settings/src/shared/prefs_usuario.dart';
 
void main() async {
  final prefs = PrefsUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  final prefs = PrefsUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings User',
      debugShowCheckedModeBanner: false,
      initialRoute: this.prefs.lastPage,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage(),
      },
    );
  }
}