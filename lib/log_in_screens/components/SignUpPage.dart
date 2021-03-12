import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'authentication_service.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
            Image.asset(
              'images/coolkid.png',
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
            ),
            Text(
              'Sign up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 16.0,
                bottom: 16.0,
              ),
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(),
                  ),
                ),
                obscureText: true,
              ),
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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
