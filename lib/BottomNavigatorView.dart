import 'package:flutter/material.dart';
import 'package:terygram/Pages/ChatPage.dart';
import 'package:terygram/Pages/settingsPage.dart';

List<Widget> screens = [ChatPage(), SettingsPage()];

class BottomNavigatorView extends StatefulWidget {
  @override
  _BottomNavigatorViewState createState() => _BottomNavigatorViewState();
}

class _BottomNavigatorViewState extends State<BottomNavigatorView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings',
      home: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              title: Text('Chat'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: Text('Settings')),
          ],
          currentIndex: currentIndex,
          onTap: (int newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
        ),
      ),
    );
  }
}
