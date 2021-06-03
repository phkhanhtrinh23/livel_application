import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  ImageList({
    Key key,
    this.image,
  }) : super(key: key);
  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
    );
  }
}
