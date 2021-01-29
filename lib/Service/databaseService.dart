import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/Screens/home/classesList.dart';
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

  List<Class> _classesListFromSnapshot(QuerySnapshot snapshot)
  {
      return snapshot.documents.map((doc)
      {
        Class temp = Class(uid: doc.data['uid']);
        temp.fromJson(doc.data);
        return temp;
      }
    ).toList();
  }


  Stream<List<Class>> get classes
  {
    return classCollection.snapshots().map(_classesListFromSnapshot);
  }

 // Future<List<Class>> qureMyClass(String uid)
  //{
    // Query temp = userCollection.where('instructorID' == uid);
     //temp.getDocuments();
  //}

}