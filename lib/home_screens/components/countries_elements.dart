import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/components/trip_screen/trip_screen.dart';

class TripElement extends StatelessWidget {
  const TripElement({
    Key key,
    this.name,
    this.number,
    this.image,
  }) : super(key: key);

  final String name, image;
  final int number;

  void _navigateToTripScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Explore',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ],
            backgroundColor: Color(0xFFDBE1FF),
          ),
          body: TripScreen(
            name: name,
          ),
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 4.0,
        left: 4.0,
        bottom: 48.0,
      ),
      child: FlatButton(
        onPressed: () => _navigateToTripScreen(context),
        child: Container(
          width: 142,
          height: 190,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                '$number places',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
