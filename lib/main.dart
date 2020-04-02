import 'package:flutter/material.dart';

void main() => runApp(SettingsPage());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TeryGram',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('TeryGram')),
        body: Column(children: [
          SettingsPage(),
        ]),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Container(
              // tried to contain text in a container to add padding so as to make the appbar bigger, but did not work
              child: Text('Settings'),
              margin: EdgeInsets.all(50),
            ),
          ),
        ),
      ),
    );
  }
}
