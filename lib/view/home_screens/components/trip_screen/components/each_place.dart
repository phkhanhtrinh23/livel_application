import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:livel_application/view/home_screens/components/trip_content/trip_main.dart';
import 'package:livel_application/model/database/storage.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({
    Key key,
    this.image,
    this.cost,
    this.date,
    this.place,
    this.country,
    this.id,
    this.list
  });

  final String image, place, country, id,list;
  final Timestamp date;
  final int cost;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getNetWorkImage(image),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            margin: const EdgeInsets.only(
              left: 22,
              right: 22,
              bottom: 12,
            ),
            width: 330,
            height: 178,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: snapshot.data,
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TripContent(
                        id: this.id,
                        checkHomeScreen: false,
                      ),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      bottom: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          DateFormat.jm().format(date.toDate()),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          list + " People registered",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          DateFormat.yMMMd().format(date.toDate()),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          place,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
