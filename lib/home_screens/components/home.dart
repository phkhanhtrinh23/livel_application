import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/components/available_elements.dart';
import 'package:livel_application/home_screens/components/countries_elements.dart';

class MainHome extends StatelessWidget {
  MainHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return ListView(
      padding: const EdgeInsets.only(top: 100),
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello Khoa Tran,',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.orange[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'which trip you want to go today?',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.orange[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(8.0),
          height: 54,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey[800],
            ),
          ),
          child: Row(
            children: <Widget>[
              Icon(Icons.search),
              Expanded(
                child: TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'Search',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Image.asset(
            'images/ha_long.jpg',
            width: _width,
          ),
          padding: const EdgeInsets.only(top: 40.0, bottom: 40.0),
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text(
                'Countries',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800],
                ),
              ),
            ),
            Spacer(),
            FlatButton(
              minWidth: 10,
              height: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.grey[300],
              onPressed: () {},
              child: Text(
                "View all",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              TripElement(
                image: 'images/usa.png',
                name: 'USA',
                number: 10,
              ),
              TripElement(
                image: 'images/uk.png',
                name: 'UK',
                number: 10,
              ),
              TripElement(
                image: 'images/swhere.png',
                name: 'Japan',
                number: 10,
              ),
              TripElement(
                image: 'images/uk.png',
                name: 'UK',
                number: 10,
              ),
              TripElement(
                image: 'images/usa.png',
                name: 'USA',
                number: 10,
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                bottom: 8.0,
              ),
              child: Text(
                'Upcoming trips',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800],
                ),
              ),
            ),
            Spacer(),
            FlatButton(
              minWidth: 10,
              height: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.grey[300],
              onPressed: () {},
              child: Text(
                "View all",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              AvailableElement(
                image: 'images/boat_1.png',
                place: 'Museum',
                cost: 9,
                country: 'Hanoi',
                day: 'Mar 07, 2021',
              ),
              AvailableElement(
                image: 'images/stadium.png',
                place: 'Museum',
                cost: 9,
                country: 'Hanoi',
                day: 'Mar 07, 2021',
              ),
              AvailableElement(
                image: 'images/boat_1.png',
                place: 'Museum',
                cost: 9,
                country: 'Hanoi',
                day: 'Mar 07, 2021',
              ),
              AvailableElement(
                image: 'images/stadium.png',
                place: 'Museum',
                cost: 9,
                country: 'Hanoi',
                day: 'Mar 07, 2021',
              ),
              AvailableElement(
                image: 'images/boat_1.png',
                place: 'Museum',
                cost: 9,
                country: 'Hanoi',
                day: 'Mar 07, 2021',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
