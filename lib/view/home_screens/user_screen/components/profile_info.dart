import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livel_application/model/database/queryFunction.dart';
import 'package:livel_application/model/database/storage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    String uid = FirebaseAuth.instance.currentUser.uid;
    return Scaffold(
      body: FutureBuilder(
        future: getJoin(uid),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done)
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 24, bottom: 16),
                    width: _width,
                    height: 148,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      color: Color(0xFF289CB4),
                    ),
                    child: Column(
                      children: [
                        Spacer(),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          'My Profile',
                          style: GoogleFonts.rubik(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 50.0,
                    ),
                    width: 200,
                    height: 100,
                    child: Center(
                      child: ClipOval(
                        child:FutureBuilder(
                          future: getNetWorkImage(snapshot.data.get('Avatar')),
                          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshotImage){
                            if(snapshotImage.connectionState == ConnectionState.done){
                              return Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: snapshotImage.data,
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              );
                            }
                            return Container();
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(
                      left: 16,
                      right: 16,
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
                          width: _width - 32,
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
                          width: _width - 32,
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
                          width: _width - 32,
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
                                    width: (_width - 32) / 2,
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
                                    width: (_width - 32) / 2,
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
                          width: _width - 32,
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
