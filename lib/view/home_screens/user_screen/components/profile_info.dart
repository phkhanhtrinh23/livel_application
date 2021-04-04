import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/model/database/queryFunction.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    String uid = FirebaseAuth.instance.currentUser.uid;
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
      body: FutureBuilder(
        future: getJoin(uid),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done)
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                              child: Image.asset('images/unknown.jpg'),
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
                            'Name',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 320,
                          height: 45,
                          padding: const EdgeInsets.only(left: 8.0),
                          margin: const EdgeInsets.only(
                            bottom: 16,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF4EAFC1)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            snapshot.data.get('Name'),
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
                            'Country',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 320,
                          height: 45,
                          padding: const EdgeInsets.only(left: 8.0),
                          margin: const EdgeInsets.only(
                            bottom: 16,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF4EAFC1)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            snapshot.data.get('Country'),
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
                                      'Age',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    alignment: Alignment.centerLeft,
                                    width: 140,
                                    height: 45,
                                    margin: const EdgeInsets.only(
                                      bottom: 16,
                                    ),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xFF4EAFC1)),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Text(
                                      snapshot.data.get('Age'),
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
                                      'Phone number',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    alignment: Alignment.centerLeft,
                                    width: 140,
                                    height: 45,
                                    margin: const EdgeInsets.only(
                                      bottom: 16,
                                    ),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xFF4EAFC1)),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Text(
                                      snapshot.data.get('Phone'),
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
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(
                            bottom: 8,
                          ),
                          child: Text(
                            'Your email',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 320,
                          height: 45,
                          padding: const EdgeInsets.only(left: 8.0),
                          margin: const EdgeInsets.only(
                            bottom: 32,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF4EAFC1)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            snapshot.data.get('Mail'),
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          return Container();
        },
      ),
    );
  }
}
