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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Mar 08, 2021',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                width: 47,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                child: Text(
                  'Go',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
