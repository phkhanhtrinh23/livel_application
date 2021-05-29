import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:livel_application/state_home.dart';
import 'package:livel_application/view/log_in_screens/components/sign_up.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  _SignInPage createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _dontShowPassword = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('Are you sure you want to quit?'),
          actions: <Widget>[
            RaisedButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            RaisedButton(
              child: Text(
                'Quit',
                style: TextStyle(
                  color: Color(0xFFEE6C4D),
                ),
              ),
              onPressed: () => SystemNavigator.pop(),
            ),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                ),
                Image.asset('images/newimage.png'),
                Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 16.0,
                  ),
                  child: Container(
                    width: 343,
                    height: 53,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide(),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 16.0,
                  ),
                  child: Container(
                    width: 343,
                    height: 53,
                    child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: _dontShowPassword
                              ? Icon(Icons.visibility_off_outlined)
                              : Icon(Icons.remove_red_eye_outlined),
                          onPressed: () {
                            setState(() {
                              _dontShowPassword = !_dontShowPassword;
                            });
                          },
                        ),
                        labelText: "Password",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide(),
                        ),
                      ),
                      obscureText: _dontShowPassword,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 48.0),
                ),
                Container(
                  width: 343,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Color(0xFFEE6C4D),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextButton(
                    child: Text(
                      "Log in",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim());
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeMain()),
                        );
                      } on FirebaseAuthException catch (error) {
                        if (error.code == 'wrong-password') {
                          return showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Text(
                                'Your password is wrong. Please try again!',
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text(
                                    'Confirm',
                                    style: TextStyle(
                                      color: Color(0xFFEE6C4D),
                                    ),
                                  ),
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                ),
                              ],
                            ),
                          );
                        } else if (error.code == 'user-not-found') {
                          return showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Text(
                                'You have not registered this account. Please register!',
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text(
                                    'Confirm',
                                    style: TextStyle(
                                      color: Color(0xFFEE6C4D),
                                    ),
                                  ),
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
