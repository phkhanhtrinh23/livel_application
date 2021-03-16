import 'package:flutter/material.dart';

class EventElements extends StatelessWidget {
  const EventElements({
    Key key,
    this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 329,
      height: 185,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(
        left: 20,
        top: 8,
        bottom: 40,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFFFEADE),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 300,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
