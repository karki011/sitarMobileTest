import 'package:com/screens/authenticate/registerFrom.dart';
import 'package:com/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SingIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
    return Container(
      child: Register(),
    );
  }
}
