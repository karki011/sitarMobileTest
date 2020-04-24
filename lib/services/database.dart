import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference in fire store database
  // if the collection is not made its going to create it
  final CollectionReference brewCollection = Firestore.instance.collection('brews');

  // create a new document user
  Future updateUserData(String sugar, String name, int strength) async {
    return await brewCollection.document(uid).setData({'sugar': sugar, 'name': name, 'strength': strength});
  }
}
