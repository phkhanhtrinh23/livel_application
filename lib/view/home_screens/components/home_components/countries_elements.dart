import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/view/home_screens/components/trip_screen/trip_screen.dart';
import 'package:livel_application/model/database/queryFunction.dart';

class TripElement extends StatelessWidget {
  const TripElement({
    Key key,
    this.name,
    this.image,
  }) : super(key: key);

  final String name, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      width: 183,
      height: 221,
      margin: const EdgeInsets.only(
        left: 16,
        right: 4,
        bottom: 40,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFF289CB4),
      ),
      child: FlatButton(
        padding: const EdgeInsets.all(0.0),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TripScreen(
              name: name,
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.topLeft,
          width: 173,
          height: 214,
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
              color: Color(0xFF289CB4),
            ),
            width: 100,
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
                FutureBuilder(
                  future: getCountry(name),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Text(
                        snapshot.data.size.toString() + ' places',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      );
                    }
                    return Text("Loading");
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
