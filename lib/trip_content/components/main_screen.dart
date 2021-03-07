import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/HomeScreen.dart';

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _expandWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Content',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFDBE1FF),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: _expandWidth,
              height: 335,
              padding: const EdgeInsets.only(
                left: 18.0,
                top: 8.0,
                bottom: 8.0,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/museum.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlatButton(
                    padding: const EdgeInsets.all(0.0),
                    minWidth: 8.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => HomeScreen(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'HANOI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(
                top: 30.0,
                left: 18.0,
                right: 145.0,
                bottom: 42.0,
              ),
              child: Text(
                'National Museum',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 23,
                right: 23,
              ),
              child: Row(
                children: [
                  Icon(Icons.timer),
                  Text('45 min'),
                  Spacer(),
                  Icon(Icons.face),
                  Text('4.4/5'),
                  Spacer(),
                  Icon(Icons.calendar_today_sharp),
                  Text('March 07, 2021'),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                right: 23,
                left: 23,
                top: 42,
                bottom: 23,
              ),
              child: Row(
                children: [
                  Icon(Icons.map_outlined),
                  Spacer(),
                  Text(
                    'Information',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Image.asset('images/line.png'),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                right: 23,
                left: 23,
              ),
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scramble.\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scramble',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                bottom: 40,
                right: 43,
                left: 43,
                top: 50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'images/bulb.png',
                        width: 100,
                        height: 100,
                      ),
                      Text('Bulb'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.phone),
                          Text('123456789'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.check),
                          Text('2 years exp.'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.calendar_today_sharp),
                          Text('20 years old'),
                        ],
                      ),
                    ],
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
