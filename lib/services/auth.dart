import 'package:com/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // create  private instance of fire base Auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // create uer obj from Firebase user we define in user class

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

//  TODO: sign on anon

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
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
