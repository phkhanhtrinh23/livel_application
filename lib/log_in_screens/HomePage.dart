import 'package:flutter/material.dart';
import 'HomeMain.dart';
import 'package:provider/provider.dart';
import 'authentication_service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("HOME PAGE"),
            RaisedButton(
              textColor: Colors.red,
              onPressed: () {
                context.read<AuthenticationService>().signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeMain()),
                );
              },
              child: Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
