import 'package:flutter/material.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({
    Key key,
    this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 22,
        right: 28,
        bottom: 12,
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
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: Text(
                  '\$9',
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