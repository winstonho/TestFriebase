import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'database.dart';
class AuthService
{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  User firebaseUserToUser(FirebaseUser user)
  {
    if(user != null)
    {
        User temp =  new  User(uid:user.uid);
        temp.name = user.displayName != null ? user.displayName :"temp";
        return temp;
    }

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
  Future registerWithEmail(String email,String password)async
  {
    try
    {
      AuthResult result =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return firebaseUserToUser(result.user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmail(String email,String password)async
  {
    try
    {
      AuthResult result =  await _auth.signInWithEmailAndPassword(email: email, password: password);
      return firebaseUserToUser(result.user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }


  //sign out
  Future signOut() async
  {
    try
    {
      if(await googleSignIn.isSignedIn() == true)
        {
          await googleSignIn.signOut();
        }

      return await _auth.signOut();
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  // sign in with google
  Future<User> signInWithGoogle() async {
    //await Firebase.initializeApp();

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );



    try
    {
      AuthResult result =  await _auth.signInWithCredential(credential);
      return firebaseUserToUser(result.user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }

  }

}
