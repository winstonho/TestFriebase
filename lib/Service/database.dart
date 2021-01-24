import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:uuid/uuid.dart';


class DatabaseService
{
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference userCollection = Firestore.instance.collection("user");
  final CollectionReference classCollection = Firestore.instance.collection("class");

  Future updateUserData(String name ,  int type,int level)async
  {
    /*
    //test for creating a unique id.
    await classCollection.document(Uuid().v4()).setData(
        {
          'name': name,
          'type': type,
          'level' : level
        }
      );
    */
      return await userCollection.document(uid).setData
      (
       {
         'name': name,
         'type': type,
         'level' : level
       }

      );
  }
}