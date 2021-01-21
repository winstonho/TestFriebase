import 'package:flutter/material.dart';
import 'package:flutter_app/Service/auth.dart';

    class  Home extends StatelessWidget {
      //note to self final also mean const in
      final AuthService _authService = AuthService();
      @override
      Widget build(BuildContext context) {
        return Scaffold(
           backgroundColor: Colors.brown[50],
           appBar: AppBar
             (
              title: Text('Got in'),
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              actions: <Widget>
                [
                  FlatButton.icon
                  (
                    icon: Icon(Icons.person),
                    label: Text('logout'),
                    onPressed: () async{ await _authService.signOut(); },
                  )
                ]
             ),
        );
      }
    }
    