import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:livel_application/view/log_in_screens/components/sign_in.dart';
import 'package:livel_application/view/tour_guide/guide_main_screen.dart';
// import 'package:livel_application/view/home_screens/user_screen/components/guidelines.dart';
// import 'package:livel_application/view/home_screens/user_screen/components/help_center.dart';
import 'package:livel_application/view/home_screens/user_screen/components/profile_info.dart';

import 'components/profile.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: _width,
              height: 148,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(top: 24, bottom: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: Color(0xFF4EAFC1),
              ),
              child: Text(
                'Your Account',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 8.0,
              ),
              width: 200,
              height: 100,
              child: Center(
                child: ClipOval(
                  child: Image.asset('images/unknown.jpg'),
                ),
              ),
            ),
            Container(
              height: _height - 260 - 58,
              margin: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  ProfileMenu(
                    text: "My Profile",
                    icon: Icon(Icons.person_outline, color: Color(0xFF477983)),
                    press: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ProfileScreen(),
                        ),
                      ),
                    },
                  ),
                  // ProfileMenu(
                  //   text: "Help Center",
                  //   icon: Icon(Icons.help_center_outlined,
                  //       color: Color(0xFF477983)),
                  //   press: () => {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (BuildContext context) => HelpCenterScreen(),
                  //       ),
                  //     ),
                  //   },
                  // ),
                  // ProfileMenu(
                  //   text: "Guidelines",
                  //   icon: Icon(Icons.bookmark_border_outlined,
                  //       color: Color(0xFF477983)),
                  //   press: () => {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (BuildContext context) => GuidelinesScreen(),
                  //       ),
                  //     ),
                  //   },
                  // ),
                  ProfileMenu(
                    text: "Log In As A Tour Guide",
                    icon: Icon(Icons.tour_outlined, color: Color(0xFF477983)),
                    press: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GuideMainScreen(),
                        ),
                      ),
                    },
                  ),
                  ProfileMenu(
                    text: "Log Out",
                    icon: Icon(Icons.logout, color: Color(0xFF477983)),
                    press: () async {
                      return showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text('Do you want to log out?'),
                            actions: <Widget>[
                              TextButton(
                                child: Text(
                                  'No',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                              ),
                              TextButton(
                                child: Text(
                                  'Yes',
                                  style: TextStyle(
                                    color: Color(0xFFEE6C4D),
                                  ),
                                ),
                                onPressed: () async {
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignInPage(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
