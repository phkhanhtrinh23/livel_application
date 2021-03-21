import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/components/available_elements.dart';
import 'package:livel_application/home_screens/components/countries_elements.dart';
import 'package:livel_application/home_screens/components/events/events.dart';

class MainHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    var day = date.day, month = date.month, year = date.year;

    return ListView(
      padding: const EdgeInsets.only(
        top: 40,
        bottom: 24,
      ),
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.only(
            top: 16,
            left: 8,
            right: 8,
          ),
          width: 348,
          height: 184,
          decoration: BoxDecoration(
            color: Color(0xFF5197E1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  'Today: $day/$month/$year',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFFFBE9A),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hello Khoa Tran,',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: 32,
                ),
                padding: EdgeInsets.all(8.0),
                height: 54,
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xFF5197E1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.search, color: Colors.white),
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    Image.asset('images/logo.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 14,
            top: 40,
          ),
          alignment: Alignment.centerLeft,
          child: Text(
            'Events',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        EventElements(
          images: [
            'images/events_1.png',
            'images/events_2.png',
            'images/events_3.png',
          ],
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
                'Recommended trips',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
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
                image: 'images/museum.png',
                place: 'National Museum',
                cost: 9,
                country: 'Hanoi',
                date: 'Mar 07, 2021',
                duration: 45,
                time: 8,
              ),
              AvailableElement(
                image: 'images/museum.png',
                place: 'National Museum',
                cost: 9,
                country: 'Hanoi',
                date: 'Mar 07, 2021',
                duration: 45,
                time: 8,
              ),
              AvailableElement(
                image: 'images/museum.png',
                place: 'National Museum',
                cost: 9,
                country: 'Hanoi',
                date: 'Mar 07, 2021',
                duration: 45,
                time: 8,
              ),
              AvailableElement(
                image: 'images/museum.png',
                place: 'National Museum',
                cost: 9,
                country: 'Hanoi',
                date: 'Mar 07, 2021',
                duration: 45,
                time: 8,
              ),
              AvailableElement(
                image: 'images/museum.png',
                place: 'National Museum',
                cost: 9,
                country: 'Hanoi',
                date: 'Mar 07, 2021',
                duration: 45,
                time: 8,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
