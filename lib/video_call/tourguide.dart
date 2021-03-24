import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/database/addCode.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_functions/cloud_functions.dart';

import 'call.dart';

class TourguidePage extends StatefulWidget {
  final String id,channel;
  TourguidePage(this.id, this.channel);
  @override
  _TourguidePage createState() => _TourguidePage(this.id, channel);
}

class _TourguidePage extends State<TourguidePage> {
  final String id,channel;
  _TourguidePage(this.id, this.channel);

  /// create a channelController to retrieve text value
  final _channelController = TextEditingController();

  /// if channel textField is validated to have error
  bool _validateError = false;

  ClientRole _role = ClientRole.Broadcaster;

  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    if(channel.isNotEmpty){
      onJoin(channel);
    }
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
              color: Colors.blue,
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
              ListTile(
                title: Text(ClientRole.Broadcaster.toString()),
                leading: Radio(
                  value: ClientRole.Broadcaster,
                  groupValue: _role,
                  onChanged: (ClientRole value) {
                    setState(() {
                      _role = value;
                    });
                  },
                ),
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                minWidth: 213,
                height: 51,
                onPressed: () {
                  onJoin(_channelController.text.trim());
                },
                child: Text('Create'),
                color: Colors.orange[800],
                textColor: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<String> getRtcToken(String channel) async {
    if (FirebaseAuth.instance.currentUser != null) {
      HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('generateRtcToken');

      var rtcToken = await callable(
          {"channelName": channel, "duration": 300});

      return rtcToken.data;
    } else {
      //user is not logged in
      throw new Exception("You are not logged in");
    }
  }

  Future<void> onJoin(String channel) async {
    // update input validation
    setState(() {
      channel.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (channel.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      addCode(this.id, channel);
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);

      //await for RTC token to be created
      String rtcToken;
      try {
        rtcToken = await getRtcToken(channel);
      } catch (error) {
        showDialog(
            context: context,
            builder: (_) => new AlertDialog(
                  title: new Text("Error"),
                  content: new Text(error.toString()),
                  actions: <Widget>[
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                    )
                  ],
                ));

        return;
      }

      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: channel,
            role: _role,
            rtcToken: rtcToken,
          ),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
}
