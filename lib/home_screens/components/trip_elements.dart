import 'package:flutter/material.dart';

class TripElement extends StatelessWidget {
  const TripElement({
    Key key,
    this.view,
    this.day,
  }) : super(key: key);

  final String view;
  final int day;

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
            'images/bulb.png',
            width: 150,
            height: 200,
          ),
          Container(
            width: 150,
            height: 20,
            child: Text(
              '$day trips',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(
            height: 30,
            width: 150,
            child: FlatButton(
              onPressed: () {},
              child: Text(
                view,
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
