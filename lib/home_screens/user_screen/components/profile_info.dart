import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key key,
    this.image,
    this.name,
    this.career,
    this.birthday,
    this.gender,
  }) : super(key: key);

  final String image, name, career, birthday, gender;

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
        backgroundColor: Color(0xFF4EAFC1),
        centerTitle: true,
        title: Text(
          'My Account',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                      color: Color(0xFF4EAFC1),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      width: 100,
                      height: 100,
                      child: ClipOval(
                        child: Image.asset(image),
                      ),
                    ),
                    top: 120,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                left: 32,
                right: 32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                      bottom: 8,
                    ),
                    child: Text(
                      'Your name',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 320,
                    height: 32,
                    padding: const EdgeInsets.only(left: 8.0),
                    margin: const EdgeInsets.only(
                      bottom: 32,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF4EAFC1)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                      bottom: 8,
                    ),
                    child: Text(
                      'Your Career',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 320,
                    height: 32,
                    padding: const EdgeInsets.only(left: 8.0),
                    margin: const EdgeInsets.only(
                      bottom: 32,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF4EAFC1)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      career,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    width: 320,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(
                                bottom: 8,
                              ),
                              child: Text(
                                'Your birthday',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 8.0),
                              alignment: Alignment.centerLeft,
                              width: 148,
                              height: 32,
                              margin: const EdgeInsets.only(
                                bottom: 16,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF4EAFC1)),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                birthday,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(
                                bottom: 8,
                              ),
                              child: Text(
                                'Gender',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 8.0),
                              alignment: Alignment.centerLeft,
                              width: 148,
                              height: 32,
                              margin: const EdgeInsets.only(
                                bottom: 16,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF4EAFC1)),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                gender,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
