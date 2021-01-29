import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/Class.dart';
import 'package:provider/provider.dart';


class ClassesList extends StatefulWidget {
  @override
  _ClassesListState createState() => _ClassesListState();
}

class _ClassesListState extends State<ClassesList> {
  @override
  Widget build(BuildContext context) {

    final list =  Provider.of<List<Class>>(context);
    print(list);
    return Container();
  }
}
