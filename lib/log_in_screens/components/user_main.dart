import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:livel_application/home_screens/user_screen/components/guidelines.dart';
import 'package:livel_application/home_screens/user_screen/components/help_center.dart';
import 'package:livel_application/home_screens/user_screen/components/profile_info.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            Container(
              width: 200,
              height: 100,
              child: Center(
                child: Image.asset('images/khoa.png'),
              ),
            ),
            ProfileMenu(
              text: "My Account",
              icon: Icon(Icons.person_outline),
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProfileScreen(),
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
              press: () {},
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
        ),
        color: Colors.blue[300],
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
