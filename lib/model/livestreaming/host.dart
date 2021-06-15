import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtm/agora_rtm.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _username = TextEditingController();
  final _channelName = TextEditingController();
  bool _isBroadcaster = false;
  String check = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Center(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Stack(
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TextFormField(
                              controller: _username,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                hintText: 'Username',
                              ),
                            ),
                            TextFormField(
                              controller: _channelName,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                hintText: 'Channel Name',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: SwitchListTile(
                            title: _isBroadcaster
                                ? Text('Broadcaster')
                                : Text('Audience'),
                            value: _isBroadcaster,
                            activeColor: Color.fromRGBO(45, 156, 215, 1),
                            secondary: _isBroadcaster
                                ? Icon(
                              Icons.account_circle,
                              color: Color.fromRGBO(45, 156, 215, 1),
                            )
                                : Icon(Icons.account_circle),
                            onChanged: (value) {
                              setState(() {
                                _isBroadcaster = value;
                                print(_isBroadcaster);
                              });
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: MaterialButton(
                            onPressed: onJoin,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Join ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Text(
                        check,
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> onJoin() async {
    if (_username.text.isEmpty || _channelName.text.isEmpty) {
      setState(() {
        check = 'Username and Channel Name are required fields';
      });
    } else {
      setState(() {
        check = '';
      });
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BroadcastPage(
            userName: _username.text,
            channelName: _channelName.text,
            isBroadcaster: _isBroadcaster,
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


class BroadcastPage extends StatefulWidget {
  final String channelName;
  final String userName;
  final bool isBroadcaster;

  const BroadcastPage({Key key, this.channelName, this.userName, this.isBroadcaster}) : super(key: key);

  @override
  _BroadcastPageState createState() => _BroadcastPageState();
}

class _BroadcastPageState extends State<BroadcastPage> {
  final _users = <int>[];
  final _infoStrings = <String>[];
  RtcEngine _engine;
  bool muted = false;

  @override
  void dispose() {
    // clear users
    _users.clear();
    // destroy sdk and leave channel
    _engine.destroy();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // initialize agora sdk

    initialize();
    _createClient();
  }

  Future<void> initialize() async {
    print('Client Role: ${widget.isBroadcaster}');
    await _initAgoraRtcEngine();
    _addAgoraEventHandlers();
    await _engine.joinChannel(null, widget.channelName, null, 0);
  }

  Future<void> _initAgoraRtcEngine() async {
    _engine = await RtcEngine.create("6efcbe6ffce7439ebba67a7c547846e3");
    await _engine.enableVideo();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    // if (widget.isBroadcaster) {
      await _engine.setClientRole(ClientRole.Broadcaster);
    // } else {
    //   await _engine.setClientRole(ClientRole.Audience);
    // }
  }

  /// Add agora event handlers
  void _addAgoraEventHandlers() {
    _engine.setEventHandler(RtcEngineEventHandler(error: (code) {
      setState(() {
        final info = 'onError: $code';
        _infoStrings.add(info);
      });
    }, joinChannelSuccess: (channel, uid, elapsed) {
      setState(() {
        final info = 'onJoinChannel: $channel, uid: $uid';
        _infoStrings.add(info);
      });
    }, leaveChannel: (stats) {
      setState(() {
        _infoStrings.add('onLeaveChannel');
        _users.clear();
      });
    }, userJoined: (uid, elapsed) {
      setState(() {
        final info = 'userJoined: $uid';
        _infoStrings.add(info);
        //if(widget.isBroadcaster)
          _users.add(uid);
      });
    }, userOffline: (uid, elapsed) {
      setState(() {
        final info = 'userOffline: $uid';
        _infoStrings.add(info);
        _users.remove(uid);
      });
    }, firstRemoteVideoFrame: (uid, width, height, elapsed) {
      setState(() {
        final info = 'firstRemoteVideo: $uid ${width}x $height';
        _infoStrings.add(info);
      });
    }));
  }

  Widget _toolbar() {
    return widget.isBroadcaster
        ? Container(
      alignment: Alignment.bottomRight,
      // padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          RawMaterialButton(
            onPressed: _onToggleMute,
            child: Icon(
              muted ? Icons.mic_off : Icons.mic,
              color: muted ? Colors.white : Colors.blueAccent,
              size: 20.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: muted ? Colors.blueAccent : Colors.white,
            padding: const EdgeInsets.all(12.0),
          ),
          RawMaterialButton(
            onPressed: () => _onCallEnd(context),
            child: Icon(
              Icons.call_end,
              color: Colors.white,
              size: 35.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.redAccent,
            padding: const EdgeInsets.all(15.0),
          ),
          RawMaterialButton(
            onPressed: _onSwitchCamera,
            child: Icon(
              Icons.switch_camera,
              color: Colors.blueAccent,
              size: 20.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(12.0),
          ),
        ],
      ),
    )
        : Container(
      alignment: Alignment.bottomRight,
      // padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          RawMaterialButton(
            onPressed: _onToggleMute,
            child: Icon(
              muted ? Icons.mic_off : Icons.mic,
              color: muted ? Colors.white : Colors.blueAccent,
              size: 20.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: muted ? Colors.blueAccent : Colors.white,
            padding: const EdgeInsets.all(12.0),
          ),
          RawMaterialButton(
            onPressed: () => _onCallEnd(context),
            child: Icon(
              Icons.call_end,
              color: Colors.white,
              size: 35.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.redAccent,
            padding: const EdgeInsets.all(15.0),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            _viewRows(),
            Column(
              children: [
                _buildInfoList(),
                Container(
                  width:400,
                  alignment: Alignment.bottomCenter,
                  child: _buildSendChannelMessage(),
                ),
              ],
            ),
            _toolbar()
          ],
        ),
      ),
    );
  }

  /// Helper function to get list of native views
  List<Widget> _getRenderViews() {
    final List<StatefulWidget> list = [];
    if(widget.isBroadcaster) {
      list.add(RtcLocalView.SurfaceView());
    }
    _users.forEach((int uid) => list.add(RtcRemoteView.SurfaceView(uid: uid)));
    return list;
  }

  /// Video view wrapper
  Widget _videoView(view) {
    return Expanded(child: Container(child: view));
  }

  /// Video view row wrapper
  Widget _expandedVideoRow(List<Widget> views) {
    final wrappedViews = views.map<Widget>(_videoView).toList();
    return Expanded(
      child: Row(
        children: wrappedViews,
      ),
    );
  }

  /// Video layout wrapper
  Widget _viewRows() {
    final views = _getRenderViews();
    switch (views.length) {
      case 1:
        return Container(
            child: Column(
              children: <Widget>[_videoView(views[0])],
            ));
      case 2:
        return Container(
            child: Column(
              children: <Widget>[
                _expandedVideoRow([views[0]]),
                _expandedVideoRow([views[1]])
              ],
            ));
      case 3:
        return Container(
            child: Column(
              children: <Widget>[
                _expandedVideoRow(views.sublist(0, 2)),
                _expandedVideoRow(views.sublist(2, 3))
              ],
            ));
      case 4:
        return Container(
            child: Column(
              children: <Widget>[
                _expandedVideoRow(views.sublist(0, 2)),
                _expandedVideoRow(views.sublist(2, 4))
              ],
            ));
      default:
    }
    return Container();
  }

  void _onCallEnd(BuildContext context) {
    Navigator.pop(context);
  }

  void _onToggleMute() {
    setState(() {
      muted = !muted;
    });
    _engine.muteLocalAudioStream(muted);
  }

  void _onSwitchCamera() {
    _engine.switchCamera();
  }
  //############Messaging
  bool _isLogin = false;
  bool _isInChannel = false;

  final _channelMessageController = TextEditingController();

  final _info = <String>[];

  AgoraRtmClient _client;
  AgoraRtmChannel _channel;

  void _createClient() async {
    _client = await AgoraRtmClient.createInstance("6efcbe6ffce7439ebba67a7c547846e3");
    _client.onMessageReceived = (AgoraRtmMessage message, String peerId) {
      _logPeer(message.text);
    };
    _client.onConnectionStateChanged = (int state, int reason) {
      print('Connection state changed: ' +
          state.toString() +
          ', reason: ' +
          reason.toString());
      if (state == 5) {
        _client.logout();
        print('Logout.');
        setState(() {
          _isLogin = false;
        });
      }
    };

    _toggleLogin();
    _toggleJoinChannel();
  }

  Future<AgoraRtmChannel> _createChannel(String name) async {
    AgoraRtmChannel channel = await _client.createChannel(name);
    channel.onMemberJoined = (AgoraRtmMember member) {
      print("Member joined: " + member.userId + ', channel: ' + member.channelId);
    };
    channel.onMemberLeft = (AgoraRtmMember member) {
      print("Member left: " + member.userId + ', channel: ' + member.channelId);
    };
    channel.onMessageReceived = (AgoraRtmMessage message, AgoraRtmMember member) {
      _logPeer(message.text);
    };
    return channel;
  }

  Widget _buildSendChannelMessage() {
    if (!_isLogin || !_isInChannel) {
      return Container();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: TextFormField(
            showCursor: true,
            enableSuggestions: true,
            textCapitalization: TextCapitalization.sentences,
            controller: _channelMessageController,
            decoration: InputDecoration(
              hintText: 'Comment...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
            ),
          ),
        ),
        Container(width: 10,),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              border: Border.all(
                color: Colors.cyan,
                width: 2,
              )),
          child: IconButton(
            icon: Icon(Icons.send, color: Colors.blue),
            onPressed: _toggleSendChannelMessage,
          ),
        )
      ],
    );
  }


  Widget _buildInfoList() {
    return Expanded(
        child: Container(
          color: Colors.cyan.withOpacity(0),
            child: _info.length > 0
                ? ListView.builder(
              reverse: true,
              itemBuilder: (context, i) {
                return Container(
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                        color: Colors.grey.withOpacity(0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start ,
                          children: [
                            Text(
                              _info[i],
                              maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                              style: TextStyle(color: Colors.cyan),
                            ),
                            // Text(
                            //   widget.userName,
                            //   textAlign: TextAlign.right,
                            //   style: TextStyle(
                            //     fontSize: 10,
                            //     color: Colors.grey
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: _info.length,
            )
                : Container()));
  }

  void _toggleLogin() async {
    if (!_isLogin) {
      try {
        await _client.login(null, widget.userName);
        print('Login success: ' + widget.userName);
        setState(() {
          _isLogin = true;
        });
      } catch (errorCode) {
        print('Login error: ' + errorCode.toString());
      }
    }
  }

  void _toggleJoinChannel() async {
    try {
      _channel = await _createChannel(widget.channelName);
      await _channel.join();
      print('Join channel success.');

      setState(() {
        _isInChannel = true;
      });
    } catch (errorCode) {
      print('Join channel error: ' + errorCode.toString());
    }
  }

  void _toggleSendChannelMessage() async {
    String text = _channelMessageController.text;
    if (text.isEmpty) {
      print('Please input text to send.');
      return;
    }
    try {
      await _channel.sendMessage(AgoraRtmMessage.fromText(text));
      _log(text);
      _channelMessageController.clear();
    } catch (errorCode) {
      print('Send channel message error: ' + errorCode.toString());
    }
  }

  void _logPeer(String info){
    print(info);
    setState(() {
      _info.insert(0,info);
    });

  }

  void _log(String info) {
    print(info);
    setState(() {
      _info.insert(0, info);
    });
  }
}
