import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:livel_application/tour_guide/guide_main_screen.dart';
import 'package:provider/provider.dart';
import 'package:livel_application/home_screens/user_screen/components/guidelines.dart';
import 'package:livel_application/home_screens/user_screen/components/help_center.dart';
import 'package:livel_application/home_screens/user_screen/components/profile_info.dart';
import 'package:livel_application/log_in_screens/components/authentication.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
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
                        builder: (BuildContext context) => ProfileScreen(
                          image: 'images/unknown.jpg',
                          name: 'Unknown',
                          career: 'Unknown',
                          birthday: 'Unknown',
                          gender: 'Unknown',
                        ),
                      ),
                    ),
                  },
                ),
                ProfileMenu(
                  text: "Help Center",
                  icon: Icon(Icons.help_center_outlined,
                      color: Color(0xFF477983)),
                  press: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => HelpCenterScreen(),
                      ),
                    ),
                  },
                ),
                ProfileMenu(
                  text: "Guidelines",
                  icon: Icon(Icons.bookmark_border_outlined,
                      color: Color(0xFF477983)),
                  press: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => GuidelinesScreen(),
                      ),
                    ),
                  },
                ),
                ProfileMenu(
                  text: "Log Out",
                  icon: Icon(Icons.logout, color: Color(0xFF477983)),
                  press: () {
                    context.read<AuthenticationService>().signOut();
                  },
                ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.press,
  }) : super(key: key);

  final String text;
  final Icon icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 68,
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Color(0xFF477983),
          width: 2,
        ),
      ),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        color: Colors.white,
        onPressed: press,
        child: Row(
          children: [
            icon,
            Container(
              child: Text(
                text,
                style: TextStyle(
                  color: Color(0xFF477983),
                  fontSize: 20,
                ),
              ),
              margin: const EdgeInsets.only(left: 5.0),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
