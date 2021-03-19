import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/components/home.dart';
import 'package:livel_application/home_screens/explore/explore.dart';
import 'package:livel_application/home_screens/user_screen/user_main.dart';
import 'package:livel_application/home_screens/your_trip/your_trip.dart';

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
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 25,
          showSelectedLabels: false,
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
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'User',
            ),
          ],
          backgroundColor: Colors.grey[350],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFF5197E1),
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        // shape: CircularNotchedRectangle(),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Color(0xFF5197E1),
      //   onPressed: () {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (BuildContext context) => YourTrip()));
      //   },
      //   child: Icon(
      //     Icons.list_rounded,
      //   ),
      //   elevation: 4.0,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
