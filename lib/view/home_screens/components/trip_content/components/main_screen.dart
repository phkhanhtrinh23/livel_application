import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:livel_application/model/database/queryFunction.dart';
import 'package:livel_application/view/home_screens/components/trip_content/components/image_list.dart';
import 'package:livel_application/view/home_screens/components/trip_content/join_button.dart';
import 'package:livel_application/view/home_screens/components/trip_content/components/tourguide.dart';
import 'package:livel_application/model/database/storage.dart';

class MainContent extends StatelessWidget {
  const MainContent({Key key, this.id, this.list, this.checkHomeScreen})
      : super(key: key);

  final String id, list;
  final bool checkHomeScreen;
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    double _width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: getTrip(id),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                  future: getNetWorkImage(snapshot.data.get('Thumbnail')),
                  builder: (context, AsyncSnapshot<dynamic> snapshotImage) {
                    if (snapshotImage.connectionState == ConnectionState.done) {
                      return Container(
                        width: _width,
                        height: 373,
                        child: PageView(
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            ImageList(
                              image: snapshotImage.data,
                            ),
                            ImageList(
                              image: snapshotImage.data,
                            ),
                            ImageList(
                              image: snapshotImage.data,
                            ),
                          ],
                        ),
                      );
                    }
                    return Container();
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 8,
                    left: 16,
                    right: 16,
                  ),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 82,
                        height: 34,
                        decoration: BoxDecoration(
                          color: Color(0xFF289CB4),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          '#' + 'Tag',
                          style: GoogleFonts.rubik(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ), // !!This is where #tag goes
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 82,
                        height: 34,
                        decoration: BoxDecoration(
                          color: Color(0xFF289CB4),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          '#' + 'Tag',
                          style: GoogleFonts.rubik(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ), // !!This is where #tag goes
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                    left: 16,
                    right: 16,
                    bottom: 42,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data.get('Place'),
                        style: GoogleFonts.rubik(
                          color: Color(0xFF289CB4),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.black54,
                          ),
                          Text(
                            snapshot.data.get('Country').toString(),
                            style: GoogleFonts.rubik(
                              color: Colors.black54,
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                      ),
                      Text(
                        '\$' + snapshot.data.get('Cost').toString(),
                        style: GoogleFonts.rubik(
                          color: Color(0xFF289CB4),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 341,
                  height: 102,
                  margin: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0x229CD8E7),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.timer,
                            size: 32,
                            color: Color(0xFF289CB4),
                          ),
                          Text(
                            'Duration',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                          ),
                          Text(
                            snapshot.data.get('Duration').toString(),
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 48,
                        width: 16,
                        child: Row(
                          children: [
                            VerticalDivider(
                              color: Color(0xFF289CB4),
                              thickness: 2.0,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star_border_outlined,
                            size: 32,
                            color: Color(0xFF289CB4),
                          ),
                          Text(
                            'Rating',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                          ),
                          Text(
                            snapshot.data.get('Rating').toString() + '/5',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 48,
                        width: 16,
                        child: Row(
                          children: [
                            VerticalDivider(
                              color: Color(0xFF289CB4),
                              thickness: 2.0,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.people_outline_sharp,
                            size: 32,
                            color: Color(0xFF289CB4),
                          ),
                          Text(
                            'Tourist',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                          ),
                          Text(
                            snapshot.data.get('UserList').length.toString(),
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(
                    right: 16,
                    left: 18,
                    top: 20,
                    bottom: 23,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Departure Time',
                            style: GoogleFonts.rubik(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              left: 16,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  DateFormat.jm().format(
                                      (snapshot.data.get('Date')).toDate()),
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  DateFormat.yMMMd().format(
                                      (snapshot.data.get('Date')).toDate()),
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    right: 16,
                    left: 18,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Divider(
                              color: Color(0x55289CB4),
                              thickness: 2.0,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(
                    right: 16,
                    left: 18,
                    top: 20,
                    bottom: 16,
                  ),
                  child: Text(
                    'Description',
                    style: GoogleFonts.rubik(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    right: 23,
                    left: 18,
                  ),
                  child: Text(
                    snapshot.data.get('Description').toString(),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                TourGuide(id: snapshot.data.get("Guide's ID")),
                Container(
                  margin: const EdgeInsets.only(
                    right: 23,
                    left: 18,
                    bottom: 42,
                    top: 23,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          right: 23,
                          left: 18,
                          bottom: 16,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '1',
                              style: TextStyle(
                                color: Color(0xFF289CB4),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              height: 100,
                              width: 16,
                              child: Row(
                                children: [
                                  VerticalDivider(
                                    color: Color(0xFF289CB4),
                                    thickness: 2.0,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 280,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'First',
                                    style: TextStyle(
                                      color: Color(0xFF289CB4),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data.get('Note').toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ), // !! Agenda
                      Container(
                        margin: const EdgeInsets.only(
                          right: 23,
                          left: 18,
                          bottom: 16,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '2',
                              style: TextStyle(
                                color: Color(0xFF289CB4),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              height: 100,
                              width: 16,
                              child: Row(
                                children: [
                                  VerticalDivider(
                                    color: Color(0xFF289CB4),
                                    thickness: 2.0,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 280,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Second',
                                    style: TextStyle(
                                      color: Color(0xFF289CB4),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data.get('Note').toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ), // !! Agenda
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.only(right: 16, left: 18),
                  child: Divider(
                    color: Color(0x55289CB4),
                    thickness: 2.0,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    right: 16,
                    left: 18,
                    bottom: 150,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Trip Fee: ',
                        style: TextStyle(
                          color: Color(0xFF289CB4),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$' + snapshot.data.get('Cost').toString(),
                        style: TextStyle(
                          color: Color(0xFF289CB4),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                JoinRegister(
                  id: snapshot.data.id,
                  code: snapshot.data.get('Code'),
                  cost: snapshot.data.get('Cost').toString(),
                  checkHomeScreen: checkHomeScreen,
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
