import 'package:flutter/material.dart';

class GuidelinesScreen extends StatelessWidget {
  const GuidelinesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blue[300],
        centerTitle: true,
        title: Text(
          'Guidelines',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              bottom: 80,
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              overflow: Overflow.visible,
              children: [
                Container(
                  width: _width,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    width: 321,
                    height: 523,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(''),
                  ),
                  top: 120,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
