import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:livel_application/model/database/queryFunction.dart';
import 'package:livel_application/view/home_screens/components/trip_content/components/image_list.dart';
import 'package:livel_application/view/home_screens/components/trip_content/join_button.dart';
import 'package:livel_application/view/home_screens/components/trip_content/components/tourguide.dart';
import 'package:livel_application/model/database/storage.dart';

class MainContent extends StatefulWidget {
  MainContent({Key key, this.id, this.list, this.checkHomeScreen})
      : super(key: key);

  final String id, list;
  final bool checkHomeScreen;

  @override
  _MainContent createState() => _MainContent(
      id: this.id, list: this.list, checkHomeScreen: this.checkHomeScreen);
}

class _MainContent extends State<MainContent> {
  _MainContent({this.id, this.list, this.checkHomeScreen});

  final String id, list;
  final bool checkHomeScreen;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0);
    double _width = MediaQuery.of(context).size.width;
    bool changedPage = false;

    return FutureBuilder(
      future: getTrip(id),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var tagList = snapshot.data.get('TagList');
          var imageList = snapshot.data.get('Image');
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: _width,
                  height: 300,
                  child: PageView.builder(
                    itemCount: imageList.length,
                    itemBuilder: (BuildContext context, int index) {
                      List<Widget> listIcon = [];
                      for (var i = 0; i < imageList.length; i++) {
                        if (i == index) {
                          listIcon.add(
                            Icon(
                              Icons.circle_sharp,
                              color: Colors.white,
                              size: 10,
                            ),
                          );
                        } else {
                          listIcon.add(
                            Icon(
                              Icons.circle_outlined,
                              color: Colors.white,
                              size: 10,
                            ),
                          );
                        }
                      }
                      return Stack(
                        children: [
                          FutureBuilder(
                            future:
                                getNetWorkImage(imageList[index].toString()),
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshotImage) {
                              if (snapshotImage.connectionState ==
                                  ConnectionState.done) {
                                return ImageList(
                                  image: snapshotImage.data,
                                );
                              }
                              return Container();
                            },
                          ),
                          Positioned(
                            left: _width / 2 - 20,
                            top: 275,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: listIcon,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(
                      top: 8,
                      left: 16,
                      right: 16,
                    ),
                    child: Container(
                      height: 40,
                      child: ListView.builder(
                          itemCount: tagList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.only(left: 4.0, right: 4.0),
                                  alignment: Alignment.center,
                                  width: tagList[index]
                                          .toString()
                                          .trim()
                                          .length
                                          .toDouble() +
                                      90.0,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF289CB4),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    '#' + tagList[index].toString(),
                                    style: GoogleFonts.rubik(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 10,
                                ),
                              ],
                            );
                          }),
                    )),
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
                    ),
                    height: 120 *
                        snapshot.data.get("Time Agenda").length.toDouble(),
                    width: 400,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.get("Time Agenda").length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(
                              right: 16,
                              left: 16,
                              bottom: 16,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (index + 1).toString(),
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
                                  width: _width - 105,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data
                                            .get("Time Agenda")[index]
                                            .toString(),
                                        style: TextStyle(
                                          color: Color(0xFF289CB4),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data
                                            .get('Place Agenda')[index]
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        } // !! Agenda
                        )),
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
