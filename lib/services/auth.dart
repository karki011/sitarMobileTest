import 'package:com/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // create  private instance of fire base Auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // create user obj from Firebase user we define in user class

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream listening to firebase for user sign in or not

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
    // mapinng to custom user class we created
  }

//  sign on anon

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
//   Register with email / password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//  TODO: Register with google
//  TODO: sign in  with google
//  sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
