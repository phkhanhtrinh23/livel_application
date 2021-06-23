import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livel_application/model/database/queryFunction.dart';
import 'package:livel_application/model/database/storage.dart';
import 'package:livel_application/view/log_in_screens/sign_in.dart';
import 'package:livel_application/view/tour_guide/guide_main_screen.dart';
// import 'package:livel_application/view/home_screens/user_screen/components/help_center.dart';
import 'package:livel_application/view/home_screens/user_screen/components/profile_info.dart';

import 'components/profile.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: getName(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
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
                      color: Color(0xFF289CB4),
                    ),
                    child: Text(
                      'Your Account',
                      style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 50.0,
                    ),
                    child: Center(
                      child: ClipOval(
                        child: FutureBuilder(
                          future: getNetWorkImage(snapshot.data.get('Avatar')),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshotImage) {
                            if (snapshotImage.connectionState ==
                                ConnectionState.done) {
                              return Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: snapshotImage.data,
                                    fit: BoxFit.contain,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              );
                            }
                            return Container();
                          },
                        ),
                      ),
                    ),
                  ),
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
                  ProfileMenu(
                    text: "Log In As A Tour Guide",
                    icon: Icon(Icons.tour_outlined, color: Color(0xFF477983)),
                    press: () async {
                      if (snapshot.data.get('TourGuide') == 'Yes') {
                        return Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GuideMainScreen(),
                          ),
                        );
                      }
                      return showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text(
                                'You cannot log in because you are not a tour guide.'),
                            actions: <Widget>[
                              TextButton(
                                child: Text(
                                  'Confirm',
                                  style: TextStyle(
                                    color: Color(0xFF289CB4),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                              ),
                            ],
                          );
                        },
                      );
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
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text(
                                  'Yes',
                                  style: TextStyle(
                                    color: Color(0xFF289CB4),
                                    fontWeight: FontWeight.normal,
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
          );
        }
        return Container();
      },
    );
  }
}
