import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/model/database/addCode.dart';
import 'package:livel_application/model/database/queryFunction.dart';
import 'package:livel_application/model/livestreaming/host.dart';
import 'package:livel_application/view/video_call/call_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_functions/cloud_functions.dart';

class addCodePage extends StatefulWidget {
  final String id, channel;
  addCodePage(this.id, this.channel);
  @override
  _addCodePage createState() => _addCodePage(this.id, channel);
}

class _addCodePage extends State<addCodePage> {
  final String id, channel;
  _addCodePage(this.id, this.channel);

  final _channelController = TextEditingController();
  bool _validateError = false;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: _width,
            height: 148,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(top: 24, bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              color: Colors.teal[300],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  ],
                ),
                Spacer(),
                Text(
                  'Livel',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: 32,
                ),
                padding: EdgeInsets.all(8.0),
                height: 54,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: TextField(
                  controller: _channelController,
                  decoration: InputDecoration(
                    errorText:
                        _validateError ? 'Channel name is mandatory' : null,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                    hintText: 'Your channel name',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              FutureBuilder(
                future: getName(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                      width: 213,
                      height: 51,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.orange[800],
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BroadcastPage(
                                      channelName: _channelController.text,
                                      userName: snapshot.data.get('Name'),
                                      isBroadcaster: true,
                                    )),
                          );
                          addCode(this.id, this.channel);
                        },
                        child: Text(
                          'Create',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }
                  return Container(
                    width: 213,
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.orange[800],
                    ),
                    child: TextButton(
                      child: Text(
                        'Create',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
    return Container();
  }
}
