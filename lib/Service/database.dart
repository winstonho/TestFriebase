import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService
{
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference testcollection = Firestore.instance.collection("user");

  Future updateUserData(String name ,  int type,int level)async
  {
      return await testcollection.document(uid).setData
      (
       {
         'name': name,
         'type': type,
         'level' : level
       }

      );
  }
}