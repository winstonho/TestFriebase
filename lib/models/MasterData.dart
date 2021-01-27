import 'package:flutter_app/Service/database.dart';
import 'package:flutter_app/models/user.dart';

class MasterData {

  MasterData._privateConstructor();

  static final MasterData instance = MasterData._privateConstructor();

  User user = new User(uid: null);

  void logOut()
  {
    user = null;
  }

  void updateUserData(User user) async
  {
    await DatabaseService().updateUserData(user);
    this.user = user;
  }


}