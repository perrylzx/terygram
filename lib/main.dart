import 'package:flutter/material.dart';

void main() => runApp(BottomNavigatorView());

List<Widget> screens = [Text('Chat'), Text('Settings')];

// class ChatPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Todo: use state to manage bubble nips, color, and name
//     Widget chatBubble = Bubble(
//       child: Text('Hello World'),
//     );

//     return MaterialApp(
//       title: 'TeryGram',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//       ),
//       home: Scaffold(
//           bottomNavigationBar: BottomNavigationBarWidget(),
//           appBar: AppBar(centerTitle: true, title: Text('TeryGram')),
//           body: ListView(
//             children: <Widget>[chatBubble],
//           )
//           // in these two columns contain the text bubble and the user icon
//           ),
//     );
//   }
// }

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
        appBar: AppBar(
          centerTitle: true,
          // Todo: Make appbar bigger
          title: Text('Settings'),
        ),
        body: screens[currentIndex],
      ),
    );
  }
}
