import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/wrapper.dart';
import 'package:flutter_app/Service/auth.dart';
import 'package:flutter_app/models/user.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

          //Wrapper it with StreamProvider so we can set up the massager we want to listen
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(home: Wrapper())
    );
  }
}


