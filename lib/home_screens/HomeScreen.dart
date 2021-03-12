import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/components/home.dart';
import 'package:livel_application/log_in_screens/components/user_main.dart';
import 'package:livel_application/home_screens/your_trip/your_trip.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    //TODO: Route is here!
    MainHome(),
    YourTrip(),
    Text(
      'Notifications page',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 50,
      ),
    ),
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
              icon: Icon(Icons.list_alt),
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'User',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.orange,
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
      //   onPressed: () {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (BuildContext context) => HomeMain()));
      //   },
      //   child: Icon(
      //     Icons.search,
      //   ),
      //   elevation: 4.0,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
