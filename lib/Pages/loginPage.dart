import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:terygram/BottomNavigatorView.dart';

var authService = FirebaseAuth.instance;

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
        child: Container(
          padding: EdgeInsets.all(32),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(onPressed: signIn, child: Text('Sign in')),
                  RaisedButton(onPressed: register, child: Text('Register')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        // TODO(Perry): this function returns a user. pass in user to chatpage and login to display username
        await authService.signInWithEmailAndPassword(
            email: (email).trim(), password: password);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BottomNavigatorView()));
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> register() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        // TODO(Perry): this function returns a user. pass in user to chatpage and login to display username
        await authService.createUserWithEmailAndPassword(
            email: (email).trim(), password: password);
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
    return await authService.signOut();
  } catch (e) {
    print(e);
  }
}
