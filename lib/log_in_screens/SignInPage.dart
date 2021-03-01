import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'HomePage.dart';
import 'signInWithGoogle.dart';
import 'package:provider/provider.dart';

import 'SignUpPage.dart';
import 'authentication_service.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(30.0)),
            Text(
              'Welcome to Livel',
              style: new TextStyle(color: Colors.blueAccent, fontSize: 25.0),
            ),
            //new Padding(padding: EdgeInsets.only(top: 50.0)),
            SignInButton(
              Buttons.Google,
              text: "Sign in with Google",
              onPressed: () {
                signInWithGoogle().then(
                  (result) {
                    if (result != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return HomePage();
                          },
                        ),
                      );
                    }
                  },
                );
              },
            ),
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
            Padding(padding: EdgeInsets.only(bottom: 15.0)),
            TextFormField(
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                  onPressed: () {
                    context.read<AuthenticationService>().signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                  },
                  child: Text("Sign in"),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text("Sign up"),
                ),
              ],
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
