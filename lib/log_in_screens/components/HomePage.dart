import 'package:flutter/material.dart';
// import 'package:livel_application/log_in_screens/HomeMain.dart';
import 'package:livel_application/video_call/index.dart';
// import 'package:livel_application/log_in_screens/HomeMain.dart';
import 'package:livel_application/home_screens/HomeScreen.dart';
// import 'package:provider/provider.dart';
// import 'authentication_service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IndexPage()),
                );
              },
              child: Text('Agora'),
            ),
            RaisedButton(
              textColor: Colors.red,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text('Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
