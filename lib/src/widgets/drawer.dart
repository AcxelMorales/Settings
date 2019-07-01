import 'package:flutter/material.dart';

import 'package:settings/src/pages/home_page.dart';
import 'package:settings/src/pages/settings_page.dart';

class WDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // elimina el padding superior del dispositivo
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/menu-img.jpg'),
                fit: BoxFit.cover
              ),
            ),
          ),

          ListTile(
            leading: Icon(
              Icons.pages,
              color: Colors.blueAccent,
            ),
            title: Text('Pages'),
            onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),

          ListTile(
            leading: Icon(
              Icons.party_mode,
              color: Colors.blueAccent,
            ),
            title: Text('Party_mode'),
            onTap: () { },
          ),

          ListTile(
            leading: Icon(
              Icons.people,
              color: Colors.blueAccent,
            ),
            title: Text('People'),
            onTap: () { },
          ),

          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.blueAccent,
            ),
            title: Text('Settings'),
            onTap: () => Navigator.pushReplacementNamed(context, SettingsPage.routeName),
          ),
          
        ],
      ),
    );
  }
}