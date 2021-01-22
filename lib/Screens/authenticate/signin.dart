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
  String error;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();



  Widget createSignInButton()
  {
    return createRaisedButtonHelper
    (
      'sign in ',
      () async
      {
        if(formKey.currentState.validate())
        {
          dynamic result = await _authService.signInWithEmail(email, password);
          if(result == null)
          {
            setState(() => error = ' fail to sign in');
          }
        }
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
          if(formKey.currentState.validate())
          {
            dynamic result = await _authService.registerWithEmail(email, password);
            if(result == null)
              {
                setState(() => error = 'please supply a vaild email');
              }
          }
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
                key: formKey,
                child: Column
                (
                  children: <Widget>
                  [
                    SizedBox(height: 20),
                    TextFormField(
                      validator: (val)=> val.isEmpty ? 'Enter an email': null,
                      onChanged: (val)
                      {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      validator: (val)=> val.length < 6 ? 'Enter an password length that 6 char long': null,
                      onChanged: (val)
                      {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 20),
                    createSignInButton(),
                    createRegisterButton(),
                    createSignInAnnaButton(),
                    SizedBox(height: 20),
                    //... so to do the if  check inside constructor ?? (yes it magic for me)
                    if(error !=null)...
                    {
                      Text(error,
                          style: TextStyle(color: Colors.red, fontSize: 14)),
                    }


                  ],
                ),
            ),

        ),


    );
  }
}
