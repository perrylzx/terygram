import 'package:flutter/material.dart';
import 'package:terygram/Setup/LoginPage.dart';
import 'package:terygram/main.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          RaisedButton(
              color: Colors.blue,
              child: Text('Logout'),
              onPressed: () async {
                await signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              })
        ],
        centerTitle: true,
        title: Text('Settings'),
      ),
    );
  }
}
