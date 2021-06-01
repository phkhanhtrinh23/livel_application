import 'package:flutter/material.dart';
import 'package:livel_application/view/log_in_screens/components/sign_in.dart';
import 'package:livel_application/view/log_in_screens/components/sign_up.dart';

class FourthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFDFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                top: 100,
                left: 20,
                right: 20,
                bottom: 84,
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image.asset(
                    'images/saly_22.png',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Travel around the world and gain knowledge through mobile phone.',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 24,
                    left: 32,
                    right: 32,
                  ),
                  padding: const EdgeInsets.only(
                    bottom: 0,
                    top: 0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xFF4EAFC1),
                  ),
                  child: Container(
                    width: 335,
                    height: 68,
                    child: TextButton(
                      child: Text(
                        'Log In',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInPage(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 24,
                    left: 32,
                    right: 32,
                  ),
                  padding: const EdgeInsets.only(
                    bottom: 0,
                    top: 0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xFF4EAFC1),
                  ),
                  child: Container(
                    width: 335,
                    height: 68,
                    child: TextButton(
                      child: Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
