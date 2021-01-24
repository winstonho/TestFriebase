import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/authenticate/authenticate.dart';
import 'package:flutter_app/Screens/home/home.dart';
import 'package:flutter_app/models/user.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //return Home();

    //getting   user data value if it got change in the stream
    final user = Provider.of<User>(context);
    return user == null ?  Authenticate(): Home();

  }
}
