import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 32, bottom: 16),
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
              child: Column(
                children: [
                  Text(
                    'Welcome to $name',
                    style: GoogleFonts.rubik(
                      fontSize: 24,
                      color: Color(0xFF289CB4),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                  ),
                  Text(
                    'Find your ideal trip today!',
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Container(height: _height - 250, child: ListScreen(name: name)),
          ],
        ),
      ),
    );
  }
}
