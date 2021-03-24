import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/database/queryFunction.dart';
import 'package:livel_application/home_screens/components/trip_content/trip_main.dart';

class AvailableElement extends StatelessWidget {
  const AvailableElement({
    Key key,
    this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTrip(id),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            margin: const EdgeInsets.only(
              left: 8.0,
            ),
            padding: const EdgeInsets.only(
              right: 16.0,
              left: 8.0,
              bottom: 16.0,
            ),
            child: TextButton(
              //padding: const EdgeInsets.all(0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => TripContent(
                      id: id,
                    ),
                  ),
                );
              },
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    width: 249,
                    height: 140,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage(snapshot.data.get('Image').toString()),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      width: 52,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Color(0xFF5197E1),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(16.0),
                          topLeft: Radius.circular(16.0),
                        ),
                      ),
                      child: Text(
                        "\$" + snapshot.data.get('Cost').toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      bottom: 16,
                      left: 5,
                      right: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                      ),
                      border: Border.all(color: Colors.grey),
                    ),
                    width: 249,
                    height: 62,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data.get('Place').toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              snapshot.data.get('Country').toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          snapshot.data.get('Date').toString(),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
