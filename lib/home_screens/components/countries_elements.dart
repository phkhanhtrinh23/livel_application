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
        left: 4.0,
        bottom: 48.0,
      ),
      child: FlatButton(
        onPressed: () {},
        child: Container(
          width: 142,
          height: 190,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/usa.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                '$number places',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
