import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/view/log_in_screens/set_profile.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPage createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _dontShowPassword = true;

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _form,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                ),
                Image.asset(
                  'images/sign_up.png',
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
                      validator: (value) {
                        if (!value.contains('@')) {
                          return 'Your email is not valid. Please enter again!';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 16.0,
                    bottom: 16.0,
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
                            setState(
                              () {
                                _dontShowPassword = !_dontShowPassword;
                              },
                            );
                          },
                        ),
                        labelText: "Password",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide(),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password for your account.';
                        } else if (value.length < 6) {
                          return 'Please enter a password with at least 6 characters.';
                        }
                        return null;
                      },
                      obscureText: _dontShowPassword,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 48,
                  ),
                ),
                Container(
                  width: 343,
                  height: 56,
                  margin: const EdgeInsets.only(
                    bottom: 32,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF289CB4),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      if (_form.currentState.validate()) {
                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PersonalInfo(
                                    emailController.text.trim(),
                                    passwordController.text.trim())),
                          );
                        } on FirebaseAuthException catch (error) {
                          if (error.code == 'email-already-in-use') {
                            return showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Text(
                                  'Your email has already been registered. Please try again!',
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text(
                                      'Confirm',
                                      style: TextStyle(
                                        color: Color(0xFF289CB4),
                                        fontWeight: FontWeight.normal,
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
                      }
                      return "Please enter again.";
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
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
