import 'package:flutter/material.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                    color: Color(0xFF5197E1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Container(
                    width: _width,
                    height: 160,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      color: Color(0xFF5197E1),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(top: 24),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
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
