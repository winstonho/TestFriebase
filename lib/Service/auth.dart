import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/models/user.dart';

class AuthService
{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User firebaseUserToUser(FirebaseUser user)
  {
    return user !=null ? User(uid:user.uid) : null;
  }

  //auth change user stream
  //something like a massaging  system so we send a user value out
  // when fire base has a StateChanged
  Stream<User> get user{
      return _auth.onAuthStateChanged
      //map((FirebaseUser user) => firebaseUserToUser(user));
      .map(firebaseUserToUser);
  }

  //sign in anon
  Future signInAnon() async{
    try
    {
      AuthResult r = await _auth.signInAnonymously();
      return firebaseUserToUser(r.user);
    }
    catch(e)
    {
      print('error' + e.toString());
      return null;
    }

  }


  //sign in email &password
  //register with email & password
  //sign out
  Future signOut() async
  {
    try
    {
      return await _auth.signOut();
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

}
