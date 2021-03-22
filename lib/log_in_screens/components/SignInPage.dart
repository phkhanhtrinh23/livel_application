import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/HomeScreen.dart';
import 'package:livel_application/video_call/tourguide.dart';
import 'signInWithGoogle.dart';
import 'package:provider/provider.dart';
import 'SignUpPage.dart';
import 'authentication_service.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
              ),
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
                              return HomeScreen();
                            },
                          ),
                        );
                      }
                    },
                  );
                },
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
                      child: Text(
                        "Log in",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    width: 343,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: Text("Sign up"),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TourguidePage()),
                      );
                    },
                    child: Text("Log in as a tourguide"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
