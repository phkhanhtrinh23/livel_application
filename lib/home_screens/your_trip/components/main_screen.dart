import 'package:flutter/material.dart';

class YourTripScreen extends StatelessWidget {
  const YourTripScreen({
    Key key,
    this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 12,
        left: 25,
        right: 25,
      ),
      width: 325,
      height: 150,
      padding: const EdgeInsets.only(
        left: 9,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Title',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              Text(
                'Mar 08, 2021',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                width: 47,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.blue[300],
                ),
                child: Text(
                  '\$9',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
