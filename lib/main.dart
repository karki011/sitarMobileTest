import 'package:com/models/user.dart';
import 'package:com/screens/wrapper.dart';
import 'package:com/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        // actively listening to auth for user
        // sign in or sign out
        value: AuthService().user,
        child: MaterialApp(home: Wrapper()));
  }
}
