import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/Screens/home/ClassesTile.dart';
import 'package:flutter_app/models/Class.dart';
import 'package:provider/provider.dart';


class ClassesList extends StatefulWidget {
  @override
  _ClassesListState createState() => _ClassesListState();
}

class _ClassesListState extends State<ClassesList> {

  List<Class> classList;

  @override
  Widget build(BuildContext context) {

    classList =  Provider.of<List<Class>>(context);

    return
      Container(
        child:
        ListView.builder
        (
          itemCount: classList.length,
          itemBuilder: (context,index)
          {
            return ClassesTile(obj: classList[index]);
          }
        ),
      );
  }
}
