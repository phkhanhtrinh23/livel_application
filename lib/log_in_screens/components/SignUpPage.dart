import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'authentication_service.dart';
import 'package:provider/provider.dart';
// import 'package:livel_application/log_in_screens/HomeMain.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign up',
            style: new TextStyle(
              color: Colors.blue,
              fontSize: 25.0,
            ),
          ),
          new Padding(padding: EdgeInsets.only(bottom: 25.0)),
          TextFormField(
            controller: emailController,
            decoration: new InputDecoration(
              labelText: "Email",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
              //fillColor: Colors.green
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: TextFormField(
              controller: passwordController,
              decoration: new InputDecoration(
                labelText: "Password",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),
                //fillColor: Colors.green
              ),
              obscureText: true,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Sign in"),
              ),
              RaisedButton(
                hoverColor: Colors.lightGreen,
                onPressed: () {
                  try {
                    context.read<AuthenticationService>().signUp(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text("Sign Up"),
              )
            ],
          )
        ],
      ),
    );
  }
}
