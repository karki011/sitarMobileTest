import 'package:com/models/user.dart';
import 'package:com/screens/authenticate/authenticate.dart';
import 'package:com/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // calling back user auth listening
    final user = Provider.of<User>(context); //acessing the user we recived
    // from stream

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
    // return either home or authenticate widget
  }
}
