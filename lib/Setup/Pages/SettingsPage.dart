import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Widget textWidget = Container(
    padding: const EdgeInsets.all(32), // adding 32px padding to all sides
    child: Text(
      'Log Out',
      softWrap: true,
    ),
  );

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(),
        child: Column(
          children: [textWidget],
        ),
      ),
    );
  }
}
