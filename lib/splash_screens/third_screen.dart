import 'package:flutter/material.dart';
import 'package:livel_application/log_in_screens/HomeMain.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 560,
              width: _width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: Color(0xFFF0FBFF),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/saly2.png',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'LET\'S TRAVEL\nwith LIVEL',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'A whole new experience for home-based tourist',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lens_outlined,
                  size: 8,
                ),
                Icon(
                  Icons.lens_sharp,
                  size: 12,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 24,
                left: 24,
                right: 24,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xFF5197E1),
              ),
              child: FlatButton(
                minWidth: 335,
                height: 68,
                child: Text(
                  'LET\'S GO',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeMain(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
