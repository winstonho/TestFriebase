import 'package:flutter/material.dart';
import 'package:flutter_app/Service/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
        backgroundColor: Colors.brown[100],
        appBar: AppBar
        (
         backgroundColor: Colors.brown[400],
         elevation: 0.0,
         title: Text('sign in to Test'),
        ),
        body: Container
        (
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
          child: RaisedButton
            (
              child: Text('sign in anna'),
              onPressed:  () async
              {
                dynamic result = await _authService.signInAnon();
                if(result == null)
                  print('error sign in');
                else
                  {
                    print('sign in');
                    print(result);
                  }
              },
            ),
        ),


    );
  }
}
