import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/components/available_elements.dart';
import 'package:livel_application/home_screens/components/countries_elements.dart';

class EventElements extends StatelessWidget {
  const EventElements({
    Key key,
    this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 329,
      height: 185,
      margin: const EdgeInsets.only(top: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFFFFEADE),
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class MainHome extends StatefulWidget {
  MainHome({Key key}) : super(key: key);

  @override
  _MainHome createState() => _MainHome();
}

class _MainHome extends State<MainHome> {
  List<EventElements> _events = [
    EventElements(
      image: 'images/events_1.png',
    ),
    EventElements(
      image: 'images/events_2.png',
    ),
    EventElements(
      image: 'images/events_3.png',
    ),
  ];
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    // double _width = MediaQuery.of(context).size.width;
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
        AnimatedSwitcher(
          duration: Duration(seconds: 1),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          child: _events[_index],
        ),
        Container(
            padding: const EdgeInsets.only(left: 32, right: 32),
            width: 329,
            height: 40,
            alignment: Alignment.center,
            child: Row(
              children: [
                _index != 0
                    ? IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          setState(() {
                            _index = _index - 1;
                          });
                        },
                      )
                    : Container(),
                Spacer(),
                _index != _events.length - 1
                    ? IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () {
                          setState(() {
                            _index = _index + 1;
                          });
                        },
                      )
                    : Container(),
              ],
            )),
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
                'Upcoming trips',
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
