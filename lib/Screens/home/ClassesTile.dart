import 'package:flutter/material.dart';
import 'package:flutter_app/models/Class.dart';


class ClassesTile extends StatelessWidget {

  final Class obj;

  ClassesTile({this.obj});

  @override
  Widget build(BuildContext context) {
    return Padding
      (
        padding: EdgeInsets.only(top: 8.0),
        child: Card
          (
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20, 0),
            child: ListTile(
              leading: CircleAvatar(radius: 25.0),
              title: Text(obj.instructorID.first),
              subtitle: Text('Max slot ${obj.maxSlot}')
            ),
          ),
      );
  }
}

