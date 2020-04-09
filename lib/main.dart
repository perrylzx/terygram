import 'package:flutter/material.dart';
import 'package:terygram/Setup/LoginPage.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(child: LoginPage()),
      ),
    );
  }
}
