import 'package:firebase_auth/firebase_auth.dart';

class AuthService
{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //sign in anon
  Future signInAnon() async{
    try
    {
      AuthResult r = await _auth.signInAnonymously();
      FirebaseUser user = r.user;
      return user;
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

}
