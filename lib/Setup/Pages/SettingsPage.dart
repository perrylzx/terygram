import 'package:flutter/material.dart';
import 'package:terygram/Setup/LoginPage.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: () async {
                await signOut();
              })
        ],
        centerTitle: true,
        title: Text('Settings'),
      ),
      body: Container(
        child: Row(
          children: [
            Center(
                // child: RaisedButton(child: Text('sdf'), onPressed:),
                ),
          ],
        ),
      ),
    );
  }
}
