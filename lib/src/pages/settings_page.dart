import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:settings/src/shared/prefs_usuario.dart';

import 'package:settings/src/widgets/drawer.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero;
  // String _nombre;

  TextEditingController _controller;
  final prefs = PrefsUsuario();

  @override
  void initState() {
    super.initState();

    this.prefs.lastPage = SettingsPage.routeName;
    this._genero = this.prefs.genero;
    this._colorSecundario = this.prefs.color;

    this._controller = TextEditingController(text: this.prefs.nombreUser);
  }

  void _setSelectedRadio(int value) {
    this.prefs.genero = value;

    this._genero = value;
    this.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          backgroundColor: (this.prefs.color) ? Colors.purple : Colors.blue,
        ),
        drawer: WDrawer(),
        body: ListView(
          children: <Widget>[

            Container(
              padding: EdgeInsets.only(
                left: 10.0,
                top: 10.0
              ),
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            Divider(),

            SwitchListTile(
              value: this._colorSecundario,
              title: Text('Color secundario'),
              onChanged: (bool value) {
                this.setState(() {
                  this._colorSecundario = value;
                  this.prefs.color = value;
                });
              },
            ),

            RadioListTile(
              value: 1,
              groupValue: this._genero,
              title: Text('Masculino'),
              onChanged: this._setSelectedRadio,
            ),

            RadioListTile(
              value: 2,
              groupValue: this._genero,
              title: Text('Femenino'),
              onChanged: this._setSelectedRadio,
            ),

            Divider(),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: this._controller,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de la persona usando el teléfono'
                ),
                onChanged: (String value) {
                  this.prefs.nombreUser = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}