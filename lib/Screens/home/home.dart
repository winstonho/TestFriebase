import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Service/auth.dart';
import 'package:flutter_app/Service/databaseService.dart';
import 'package:flutter_app/models/Class.dart';
import 'package:provider/provider.dart';
import 'classesList.dart';



class  Home extends StatelessWidget {
      //note to self final also mean const in
      final AuthService _authService = AuthService();
      @override
      Widget build(BuildContext context) {
        return
        StreamProvider<List<Class>>.value
          (
          value: DatabaseService().classes,
          child: Scaffold(
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
            body: ClassesList(),
        )
        );
      }
    }
    