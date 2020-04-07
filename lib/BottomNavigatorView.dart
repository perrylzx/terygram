import 'package:flutter/material.dart';
import 'package:terygram/Setup/Pages/SettingsPage.dart';

List<Widget> screens = [
  Text('Chat'),
  SettingsPage()
]; // TODO(Perry): fix bug where every time i click on the settings tab, it renders SettingsPage widget which has this bottomNavigationBar, created an infinite amount of navigatorbars

// Settings Page model
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
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // Todo: Make appbar bigger
          title: Text('Settings'),
        ),
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
            /// When an icon in the [BottomNavigationBar] is tapped,
            /// we want to change the current view to the new view
            /// representented by the recently tapped
            /// [BottomNavigationBarItem].
            setState(() {
              currentIndex = newIndex;
            });
          },
        ),
      ),
    );
  }
}
