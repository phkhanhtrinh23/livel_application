import 'package:flutter/material.dart';
import 'package:livel_application/view/home_screens/HomeScreen.dart';
import 'package:rating_bar/rating_bar.dart';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreen createState() => _RatingScreen();
}

class _RatingScreen extends State<RatingScreen> {
  double _rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RatingBar(
            onRatingChanged: (rating) => setState(() => _rating = rating),
            filledIcon: Icons.star,
            emptyIcon: Icons.star_border,
            halfFilledIcon: Icons.star_half,
            isHalfAllowed: true,
            filledColor: Colors.green,
            emptyColor: Color(0xFF4EAFC1),
            halfFilledColor: Colors.amberAccent,
            size: 48,
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 32,
            ),
          ),
          Container(
            width: 160,
            height: 51,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Color(0xFF4EAFC1),
            ),
            child: TextButton(
              child: Text(
                "Submit",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
