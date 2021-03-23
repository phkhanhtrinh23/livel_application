import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/log_in_screens/HomeMain.dart';
import 'package:livel_application/log_in_screens/components/personalInfo.dart';
import 'authentication_service.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPage createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
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
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
              ),
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
                  bottom: 16.0,
                ),
                child: Container(
                  width: 343,
                  height: 53,
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye_outlined),
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
              Container(
                width: 343,
                height: 56,
                margin: const EdgeInsets.only(
                  bottom: 32,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFEE6C4D),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: FlatButton(
                  onPressed: () async{
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PersonalInfo(
                              emailController.text.trim(), passwordController.text.trim()
                          )
                      ),
                    );
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
    );
  }
}
