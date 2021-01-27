import 'dart:convert' ;

enum AccountType
{
  user,admin
}



class User
{
  String uid;
  String name = "dummy";
  DateTime birthday = new DateTime.now();
  int accountType = AccountType.user.index;
  List<String> classID = <String>[];
  //List<String> postID = <String>[];

  User({this.uid});

  Map<String, dynamic> toJson() =>
      {
        'id'  : uid,
        'name': name,
        'DateTime': "${birthday.month}/${birthday.day}/${birthday.year}",
        'accountType' : accountType,
        'classID'     : jsonEncode(classID)
      };

  void fromJson ( Map<String, dynamic> json)
  {
    name = json['name'] as String;
    accountType = json['accountType'] as int;
    //accountType = json['DateTime'] as int;
    classID = json['classID'] != null ? List.from(jsonDecode(json['classID'])) : null;
  }

}



