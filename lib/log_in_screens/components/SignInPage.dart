import 'package:flutter/material.dart';
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('images/travel.png'),
            Text(
              'Log in',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            FlatButton(
              child: Image.asset('images/googlebutton.png'),
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
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
            ),
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
              obscureText: true,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 343,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Color(0xFFEE6C4D),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      context.read<AuthenticationService>().signIn(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                    },
                    child: Text("Log in"),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text("Sign up"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
