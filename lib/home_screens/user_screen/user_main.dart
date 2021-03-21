import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:livel_application/home_screens/user_screen/components/guidelines.dart';
import 'package:livel_application/home_screens/user_screen/components/help_center.dart';
import 'package:livel_application/home_screens/user_screen/components/profile_info.dart';
import 'package:livel_application/log_in_screens/components/authentication_service.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
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
                color: Color(0xFF5197E1),
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
                bottom: 16,
              ),
              width: 100,
              height: 100,
              child: CircleAvatar(
                child: Image.asset(
                  'images/unknown.jpg',
                ),
              ),
            ),
            ProfileMenu(
              text: "My Profile",
              icon: Icon(Icons.person_outline),
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProfileScreen(
                      image: 'images/khoa.png',
                      name: 'Tran Dang Khoa',
                      career: 'UI/UX Designer',
                      birthday: 'June 06, 2001',
                      gender: 'Male',
                    ),
                  ),
                ),
              },
            ),
            ProfileMenu(
              text: "Help Center",
              icon: Icon(Icons.help_center_outlined),
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
              icon: Icon(Icons.bookmark_border_outlined),
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
              icon: Icon(Icons.logout),
              press: () {
                context.read<AuthenticationService>().signOut();
              },
            ),
          ],
        ),
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Color(0xFF5197E1)),
        ),
        color: Colors.white,
        onPressed: press,
        child: Row(
          children: [
            icon,
            Container(
              child: Text(text),
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
