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
            TextButton(
              child: Text(
                'Quit',
                style: TextStyle(
                  color: Color(0xFF289CB4),
                  fontWeight: FontWeight.normal,
                ),
              ),
              onPressed: () => SystemNavigator.pop(),
            ),
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
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
            showUnselectedLabels: false,
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
            backgroundColor: Colors.white,
            currentIndex: _selectedIndex,
            selectedItemColor: Color(0xFF289CB4),
            onTap: (value) {
              setState(
                () {
                  _selectedIndex = value;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
