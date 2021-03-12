import 'package:flutter/material.dart';

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: _width,
            height: 335,
            padding: const EdgeInsets.only(
              left: 18.0,
              top: 8.0,
              bottom: 8.0,
              right: 18.0,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/museum.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      'HANOI',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      width: 52,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.orange[800],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        '\$9',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(
              top: 30.0,
              left: 18.0,
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
                Text(
                  'Information',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
            margin: const EdgeInsets.only(
              right: 23,
              left: 23,
              top: 42,
            ),
            child: Row(
              children: [
                Icon(Icons.map_outlined),
                Text(
                  'Tour Guide',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 23,
              right: 43,
              left: 43,
              top: 34,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Column(
                  children: [
                    Image.asset(
                      'images/khoa.png',
                      width: 100,
                      height: 100,
                    ),
                    Text(
                      'Khoa Tran',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.phone),
                        Text('090 287 6927'),
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
                Spacer(),
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
                Text(
                  'Note',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              right: 23,
              left: 23,
              bottom: 200,
            ),
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scramble.\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scramble',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 20,
            ),
            child: FlatButton(
              minWidth: 213,
              height: 51,
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                'JOIN',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
