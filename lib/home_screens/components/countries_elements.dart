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
              FlatButton(
                minWidth: 2.5,
                onPressed: () {},
                child: Image.asset('images/slider.png'),
              )
            ],
            backgroundColor: Colors.white,
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
          alignment: Alignment.topRight,
          width: 142,
          height: 190,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.blue[600],
            ),
            width: 62,
            height: 36,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$number places',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
