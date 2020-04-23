import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // create  private instance of fire base Auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

//  TODO: sign on anon

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      print('Inside sign in anon $user');
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
//  TODO: sign with email / password
//  TODO: Register with email / password
//  TODO: Register with google
//  TODO: sign in  with google
//  TODO: sign out

}
