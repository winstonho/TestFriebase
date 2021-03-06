import 'dart:convert' ;

enum ClassType
{
  normal,easy
}



class Class
{
  String uid;
  int  maxSlot = 10;
  int currentSlot = 0;
  DateTime classDate =  new DateTime.now();
  int classType = ClassType.normal.index;
  List<String> instructorID = <String>[];
  List<String> studentID = <String>[];


  Class({this.uid});

  Map<String, dynamic> toJson() =>
      {
        'id'  : uid,
        'maxSlot': maxSlot,
        'currentSlot': currentSlot,
        'DateTime': "${classDate.month}/${classDate.day}/${classDate.year}/${classDate.hour}/${classDate.minute}",
        'classType' : classType,
        'instructorID'     : jsonEncode(instructorID),
        'studentID'     : jsonEncode(studentID)
      };
  void fromJson ( Map<String, dynamic> json)
  {
    uid = json['id'] as String;
    maxSlot = json['maxSlot'] as int;
    //accountType = json['DateTime'] as int;
    currentSlot = json['currentSlot'];
    instructorID = json['instructorID'] != null ? List.from(jsonDecode(json['instructorID'])) : null;
  }
}



