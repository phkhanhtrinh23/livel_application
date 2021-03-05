import 'package:flutter/material.dart';

class AvailableElement extends StatelessWidget {
  const AvailableElement({
    Key key,
    this.name,
    this.day,
  }) : super(key: key);

  final String name, day;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF687EF4),
      margin: EdgeInsets.only(
        right: 8.0,
        left: 8.0,
        bottom: 16.0,
      ),
      child: Column(
        children: <Widget>[
          Image.asset(
            'images/bike_rider.png',
            width: 300,
            height: 200,
          ),
          Container(
            width: 300,
            height: 30,
            child: Text(
              '$name',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: 300,
            height: 30,
            color: Colors.white,
            child: Row(
              children: [
                Text(
                  '$day',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Spacer(),
                Text(
                  'Rating:',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
