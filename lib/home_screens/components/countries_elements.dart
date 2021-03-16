import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/components/trip_screen/trip_screen.dart';

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
      width: 182,
      height: 248,
      margin: const EdgeInsets.only(
        left: 16,
        right: 4,
        bottom: 40,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFF5197E1),
      ),
      child: FlatButton(
        padding: const EdgeInsets.all(0),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TripScreen(
              name: name,
            ),
          ),
        ),
        child: Container(
          alignment: Alignment.topLeft,
          width: 164,
          height: 230,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
              color: Color(0xFF5197E1),
            ),
            width: 77,
            height: 45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '$number places',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
