import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
        backgroundColor: Color(0xFFDBE1FF),
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
              text: " My Account",
              icon: Icon(Icons.person),
              press: () => {},
            ),
            ProfileMenu(
              text: " Notifications",
              icon: Icon(Icons.notifications),
              press: () {},
            ),
            ProfileMenu(
              text: " Settings",
              icon: Icon(Icons.settings),
              press: () {},
            ),
            ProfileMenu(
              text: " Help Center",
              icon: Icon(Icons.book),
              press: () {},
            ),
            ProfileMenu(
              text: " Log Out",
              icon: Icon(Icons.backspace),
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
        color: Color(0xFFF5F6F9),
        onPressed: press,
        child: Row(
          children: [
            icon,
            Expanded(child: Text(text)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

// class ProfilePic extends StatelessWidget {
//   const ProfilePic({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 125,
//       width: 125,
//       child: Stack(
//         fit: StackFit.expand,
//         overflow: Overflow.visible,
//         children: [
//           CircleAvatar(
//             backgroundColor: Colors.blue[123],
//           ),
//           Positioned(
//             top: 150,
//             right: 10,
//             bottom: 10,
//             child: SizedBox(
//               height: 46,
//               width: 46,
//               child: FlatButton(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(50),
//                   side: BorderSide(color: Colors.white),
//                 ),
//                 color: Color(0xFFF5F6F9),
//                 onPressed: () {},
//                 child: null,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
