import 'package:flutter/material.dart';

class TripElement extends StatelessWidget {
  const TripElement({
    Key key,
    this.name,
    this.number,
    this.image,
  }) : super(key: key);

  final String name, image;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 4.0,
        left: 16.0,
        bottom: 48.0,
      ),
      child: FlatButton(
        onPressed: () {},
        child: Column(
          children: <Widget>[
            Image.asset(
              image,
              width: 142,
              height: 190,
            ),
            Container(
              width: 142,
              height: 24,
              child: Row(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '$number places',
                    style: TextStyle(
                      fontSize: 15,
                    ),
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
