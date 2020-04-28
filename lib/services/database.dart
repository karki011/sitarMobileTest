import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com/models/brew.dart';
import 'package:com/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference in fire store database
  // if the collection is not made its going to create it
  final CollectionReference brewCollection = Firestore.instance.collection('brews');

  // create a new document user
  Future updateUserData(String sugar, String name, int strength) async {
    return await brewCollection
        .document(uid)
        .setData({'sugar': sugar, 'name': name, 'strength': strength});
  }

  //brew list from  firebase snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugar: doc.data['sugar'] ?? '0',
      );
    }).toList();
  }

  // user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugar: snapshot.data['sugar'],
      strength: snapshot.data['strength'],
    );
  }

  // get brew stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  //get user doc stream, this is need to show the data from db to setting form
  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
