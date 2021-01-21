import 'package:flutter/material.dart';
import 'package:flutter_app/Service/auth.dart';


Widget createRaisedButtonHelper(String text, Function onPressFunction ,
    { barkGroundColour : Colors.white , textColour : Colors.black}
    )
{
  return RaisedButton
    (
      color: barkGroundColour,
      child: Text(text,style: TextStyle(color: textColour)),
      onPressed:onPressFunction

  );
}


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();

  String email;
  String password;



  Widget createSignInButton()
  {
    return createRaisedButtonHelper
    (
      'sign in ',
      () async
      {
        print(email);
        print(password);
      }
    );
  }

  Widget createRegisterButton()
  {
    return createRaisedButtonHelper
      (
        'Register',
            () async
        {
          print(email);
          print(password);
        }
    );
  }

  Widget createSignInAnnaButton()
  {
    return createRaisedButtonHelper
      (
       'sign in anna', () async
        {
          dynamic result = await _authService.signInAnon();
          if(result == null)
          print('error sign in');
          else
          {
           print('sign in');
           print(result);
          }
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold
    (
        backgroundColor: Colors.brown[100],
        appBar: AppBar
        (
         backgroundColor: Colors.brown[400],
         elevation: 0.0,
         title: Text('sign in to Test'),
        ),
        body: Container
        (
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
          child: Form
            (
                child: Column
                (
                  children: <Widget>
                  [
                    SizedBox(height: 20),
                    TextFormField(
                      onChanged: (val)
                      {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      onChanged: (val)
                      {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 20),
                    createSignInButton(),
                    createRegisterButton(),
                    createSignInAnnaButton(),


                  ],
                ),
            ),

        ),


    );
  }
}
