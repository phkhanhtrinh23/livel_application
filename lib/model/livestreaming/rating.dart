import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/view/home_screens/HomeScreen.dart';
import 'package:rating_bar/rating_bar.dart';

class RatingScreen extends StatefulWidget {
  final String id;

  RatingScreen(this.id);

  @override
  _RatingScreen createState() => new _RatingScreen();
}

class _RatingScreen extends State<RatingScreen> {
  double _rating;

  Future<DocumentSnapshot> get() async {
    return await FirebaseFirestore.instance
        .collection('Trips')
        .doc(this.widget.id)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: FutureBuilder(
      //   future: get(),
      //   builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
      //     if(snapshot.connectionState == ConnectionState.done){
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
              onPressed: () async {
                DocumentSnapshot dictionary = await FirebaseFirestore.instance
                    .collection('Dictionary')
                    .doc('rating')
                    .get();
                DocumentSnapshot trip = await FirebaseFirestore.instance
                    .collection('Trips')
                    .doc(this.widget.id)
                    .get();
                String place = trip.get('Place').toString().toLowerCase();
                print(place);
                List<dynamic> list = dictionary.get(place);
                await FirebaseFirestore.instance
                    .collection('Dictionary')
                    .doc('rating')
                    .update({
                  place: [list[0] + 1, list[1] + _rating]
                });
                await FirebaseFirestore.instance
                    .collection('Trips')
                    .doc(this.widget.id)
                    .update({"Rating": (list[1] + _rating) / (list[0] + 1)});
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
      //     }
      //     return Container();
      //   },
      // )
    );
  }
}
