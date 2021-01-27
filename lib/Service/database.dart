import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/Class.dart';
import 'package:flutter_app/models/user.dart';
//import 'package:uuid/uuid.dart';


class DatabaseService
{
  final CollectionReference userCollection = Firestore.instance.collection("user");
  final CollectionReference classCollection = Firestore.instance.collection("class");

  Future updateClassData(Class classes)async
  {
    return await classCollection.document(classes.uid).setData
      (
        classes.toJson()
    );
  }

  Future updateUserData(User user)async
  {
      return await userCollection.document(user.uid).setData
      (
          user.toJson()
      );
  }
  Future<User> getUserDataFromFireBase(String uid) async
  {
     var doc =  await userCollection.document(uid).get();
     if(doc != null)
     {
        User obj = User(uid: uid);
        obj.fromJson(doc.data);
        return obj;
     }
      return null;
  }

}