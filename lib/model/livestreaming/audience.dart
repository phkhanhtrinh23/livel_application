import 'dart:async';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/view/video_call/call_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_functions/cloud_functions.dart';


class TouristPage extends StatefulWidget {
  final String channel;
  TouristPage(this.channel);
  @override
  _TouristPage createState() => _TouristPage(this.channel);
}

class _TouristPage extends State<TouristPage> {
  final String channel;
  _TouristPage(this.channel);

  ClientRole _role = ClientRole.Audience;

  @override
  void dispose() {
    // dispose input controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      throw new Exception("You are not logged in");
    }
  }

  Future<void> onJoin(String channel) async {
    // update input validation
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
