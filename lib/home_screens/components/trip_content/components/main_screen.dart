import 'package:flutter/material.dart';
import 'package:livel_application/video_call/tourist.dart';

class MainContent extends StatelessWidget {
  const MainContent({
    Key key,
    this.country,
    this.place,
    this.image,
    this.date,
    this.cost,
    this.duration,
    this.time,
  }) : super(key: key);

  final String country, place, image, date;
  final int cost, duration, time;

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
                image: AssetImage('$image'),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      '$country',
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
                        color: Color(0xFFEE6C4D),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        '\$$cost',
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
              '$place',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5197E1),
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
                Text('$duration min'),
                Spacer(),
                Icon(Icons.face),
                Text('4.4/5'),
                Spacer(),
                Icon(Icons.calendar_today_sharp),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$time:00'),
                    Text('$date'),
                  ],
                ),
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
                    color: Color(0xFFEE6C4D),
                    fontWeight: FontWeight.normal,
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
                    color: Color(0xFFEE6C4D),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 23,
              top: 34,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 48,
                    right: 38,
                  ),
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'images/unknown.jpg',
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Padding(padding: const EdgeInsets.all(8)),
                      Text(
                        'Khoa Tran',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 48),
                  child: Column(
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
                ),
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
                    color: Color(0xFFEE6C4D),
                    fontWeight: FontWeight.normal,
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
              color: Color(0xFFEE6C4D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                'JOIN',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TouristPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
