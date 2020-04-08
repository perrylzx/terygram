import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:terygram/BottomNavigatorView.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return 'Please type an email';
                }
                return null;
              },
              onSaved: (input) => email = input,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              validator: (input) {
                if (input.length < 6) {
                  return 'Your password needs to be atleast 6 characters';
                }
                return null;
              },
              onSaved: (input) => password = input,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            RaisedButton(onPressed: signIn, child: Text('Sign in')),
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        Object user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: (email).trim(), password: password));
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BottomNavigatorView()));
      } catch (e) {
        print(e);
      }
    }
  }
}

Future signOut() async {
  try {
    return await FirebaseAuth.instance.signOut();
  } catch (e) {
    print(e);
  }
}
