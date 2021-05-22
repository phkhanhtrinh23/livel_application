import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:livel_application/view/home_screens/components/home.dart';
import 'package:livel_application/view/home_screens/explore/explore.dart';
import 'package:livel_application/view/home_screens/user_screen/user_main.dart';
import 'package:livel_application/view/home_screens/your_trip/your_trip.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    MainHome(),
    ExploreScreen(),
    YourTrip(),
    UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('Are you sure you want to quit?'),
          actions: <Widget>[
            RaisedButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            RaisedButton(
              child: Text(
                'Quit',
                style: TextStyle(
                  color: Color(0xFFEE6C4D),
                ),
              ),
              onPressed: () => SystemNavigator.pop(),
            ),
          ],
        ),
      ),
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomAppBar(
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 25,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Your Trips',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'User',
              ),
            ],
            backgroundColor: Color(0xFF4EAFC1),
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
