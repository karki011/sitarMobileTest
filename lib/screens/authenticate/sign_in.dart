import 'package:com/services/auth.dart';
import 'package:flutter/material.dart';

class SingIn extends StatefulWidget {
  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  // user SignInAnon from service auth.dart

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Sin in to Brew Crew'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
        child: RaisedButton(
            child: Text('Sign in Anon'),
            onPressed: () async {
              await _auth.signInAnon();
            }),
      ),
    );
  }
}
