import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_functions/cloud_functions.dart';

import 'call_page.dart';

class TouristPage extends StatefulWidget {
  final String channel;
  TouristPage(this.channel);
  @override
  _TouristPage createState() => _TouristPage(this.channel);
}

class _TouristPage extends State<TouristPage> {
  final String channel;
  _TouristPage(this.channel);

  /// create a channelController to retrieve text value
  final _channelController = TextEditingController();

  /// if channel textField is validated to have error
  bool _validateError = false;

  ClientRole _role = ClientRole.Audience;

  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    if (channel.isNotEmpty) {
      onJoin(channel);
    }
    return Container();
  }

  Future<String> getRtcToken(String channel) async {
    if (FirebaseAuth.instance.currentUser != null) {
      HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('generateRtcToken');

      var rtcToken = await callable({"channelName": channel, "duration": 300});

      return rtcToken.data;
    } else {
      //user is not logged in
      throw new Exception("You are not logged in");
    }
  }

  Future<void> onJoin(String channel) async {
    // update input validation
    setState(
      () {
        channel.isEmpty ? _validateError = true : _validateError = false;
      },
    );
    if (channel.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
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
