import 'package:flutter/material.dart';
import 'components/list_screen.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({
    Key key,
    this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 24, bottom: 16),
            width: _width,
            height: 148,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              color: Color(0xFF4EAFC1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  ],
                ),
                Spacer(),
                Text(
                  'Explore',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
              top: 35,
              left: 24,
              right: 24,
            ),
            child: Text(
              'Welcome to $name',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFFEE6C4D),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(height: _height - 225, child: ListScreen(name: name)),
        ],
      ),
    );
  }
}
