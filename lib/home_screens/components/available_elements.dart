import 'package:flutter/material.dart';

class AvailableElement extends StatelessWidget {
  const AvailableElement({
    Key key,
    this.name,
    this.day,
    this.image,
  }) : super(key: key);

  final String name, day, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 16.0,
        left: 4.0,
        bottom: 16.0,
      ),
      child: FlatButton(
        onPressed: () {},
        child: Column(
          children: <Widget>[
            Image.asset(
              image,
              width: 208,
              height: 200,
            ),
            Container(
              width: 208,
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
              width: 208,
              height: 30,
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
                    'Cost:',
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
      ),
    );
  }
}
