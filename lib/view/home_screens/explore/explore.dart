import 'package:flutter/material.dart';
import 'package:livel_application/view/home_screens/explore/all_trip.dart';
import 'dart:math';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({Key key}) : super(key: key);
  @override
  ExploreScreenState createState() =>
      new ExploreScreenState(searchString: '', field: 'Place');
}

class ExploreScreenState extends State<ExploreScreen> {
  ExploreScreenState({this.searchString, this.field});
  final String searchString, field;
  String dropdown = 'Place';
  String lSearch = '';
  String lField = 'Place';

  @override
  Widget build(BuildContext context) {
    TextEditingController search = new TextEditingController();
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 24, bottom: 16),
              width: _width,
              height: 148,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: Color(0xFF4EAFC1),
              ),
              child: Text(
                'Explore',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                top: 16,
                bottom: 16,
              ),
              padding: EdgeInsets.all(8.0),
              height: 54,
              width: 330,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  DropdownButton<String>(
                    value: dropdown,
                    icon: const Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      color: Color(0xFF4EAFC1),
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(
                        color: Color(0xFF4EAFC1), fontWeight: FontWeight.bold),
                    underline: Container(
                      height: 0,
                      color: Colors.white,
                    ),
                    onChanged: (String newValue) {
                      setState(
                        () {
                          dropdown = newValue;
                        },
                      );
                    },
                    items: <String>['Place', 'City', 'Country']
                        .map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  Expanded(
                    child: TextFormField(
                      controller: search,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(
                        () {
                          lField = dropdown;
                          lSearch = search.text;
                        },
                      );
                    },
                    style: TextButton.styleFrom(primary: Color(0xFF4EAFC1)),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi),
                      child: Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: _height - 295,
                child: AllTrip(searchString: lSearch, field: lField)),
          ],
        ),
      ),
    );
  }
}
