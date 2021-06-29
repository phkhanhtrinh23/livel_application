import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:livel_application/model/database/addCode.dart';
import 'package:livel_application/model/database/queryFunction.dart';
import 'package:livel_application/model/livestreaming/host.dart';
import 'package:permission_handler/permission_handler.dart';

class GuideTripScreen extends StatelessWidget {
  const GuideTripScreen({Key key, this.id, this.name});

  final String id;
  final String name;

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTrip(this.id),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 16,
            ),
            width: 355,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: Color(0xFF289CB4),
              ),
            ),
            child: FutureBuilder(
              future: getName(),
              builder:
                  (BuildContext context, AsyncSnapshot<DocumentSnapshot> snap) {
                if (snap.connectionState == ConnectionState.done) {
                  return TextButton(
                    onPressed: () async {
                      if (snapshot.data.get('Code').toString().isEmpty) {
                        await _handleCameraAndMic(Permission.camera);
                        await _handleCameraAndMic(Permission.microphone);
                        addCode(
                            this.id,
                            snapshot.data.get('Place') +
                                snapshot.data.get('Date').toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BroadcastPage(
                              channelName: snapshot.data.get('Place') +
                                  snapshot.data.get('Date').toString(),
                              userName: snap.data.get('Name'),
                              isBroadcaster: true,
                              id: id,
                              gid: snapshot.data.get('Id_call').toInt(),
                            ),
                          ),
                        );
                      } else {
                        await _handleCameraAndMic(Permission.camera);
                        await _handleCameraAndMic(Permission.microphone);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BroadcastPage(
                              channelName: snapshot.data.get('Code').toString(),
                              userName: snap.data.get('Name'),
                              isBroadcaster: true,
                              id: id,
                              gid: snapshot.data.get('Id_call').toInt(),
                            ),
                          ),
                        );
                      }
                    },
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 16),
                          child: Image.asset(
                            'images/trip_image.png',
                            width: 150,
                            height: 120,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              DateFormat.jm()
                                  .format((snapshot.data.get('Date')).toDate()),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4EAFC1),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  color: Color(0xFF4EAFC1),
                                  size: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                ),
                                Text(
                                  DateFormat.yMMMd().format(
                                      (snapshot.data.get('Date')).toDate()),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Color(0xFF4EAFC1),
                                  size: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                ),
                                Text(
                                  snapshot.data.get('Place').toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                            ),
                            Text(
                              "\$" + snapshot.data.get('Cost').toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
