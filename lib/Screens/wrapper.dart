import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/authenticate/authenticate.dart';
import 'package:flutter_app/Screens/home/home.dart';
//import 'package:flutter_app/Screens/loginPage2.dart';
import 'package:flutter_app/Service/database.dart';
import 'package:flutter_app/models/Class.dart';
import 'package:flutter_app/models/MasterData.dart';
import 'package:flutter_app/models/user.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
class Wrapper extends StatelessWidget {


  void forTesting( User user) async
  {
    if(user != null)
    {
      print('hello word');

      try
      {
        dynamic getUser = await DatabaseService().getUserDataFromFireBase(user.uid);
        if(getUser != null)
        {
          user = getUser;
        }
      }
      catch (e)
      {
        print('error' + e.toString());
      }

      Class obj = new Class( uid : Uuid().v4());
      user.classID.add(obj.uid);



      obj.instructorID.add(user.uid);

      //obj.studentID.add(user.uid)
      MasterData.instance.updateUserData(user);
      DatabaseService().updateClassData(obj);
    }
  }


  @override
  Widget build(BuildContext context) {
    //return Home();

    //getting   user data value if it got change in the stream
    User user = Provider.of<User>(context);
    if(user != null)
    {
      forTesting(user);
      print('singleton working');
      print(MasterData.instance.user.classID.toString());
    }
    return user == null ?  Authenticate(): Home();

    //return user == null ?  LoginPage(): Home();

  }
}
