import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/model/authentication.dart';
import 'package:livel_application/state_home.dart';

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
              // TextButton(
              //   child: Image.asset('images/googlebutton.png'),
              //   onPressed: () {
              //     signInWithGoogle().then(
              //       (result) {
              //         if (result.isNotEmpty) {
              //           Navigator.of(context).push(
              //             MaterialPageRoute(
              //               builder: (context) {
              //                 return HomeMain();
              //               },
              //             ),
              //           );
              //         }
              //       },
              //     );
              //   },
              // ),
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
                  onPressed: () async {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim());
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeMain()),
                    );
                  },
                  child: Text(
                    "Log in",
                    style: TextStyle(color: Colors.white),
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
