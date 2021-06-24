import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtm/agora_rtm.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/model/livestreaming/rating.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

class BroadcastPage extends StatefulWidget {
  final String channelName;
  final String userName;
  final bool isBroadcaster;

  const BroadcastPage(
      {Key key, this.channelName, this.userName, this.isBroadcaster})
      : super(key: key);

  @override
  _BroadcastPageState createState() => _BroadcastPageState();
}

class _BroadcastPageState extends State<BroadcastPage> {
  final _users = <int>[];
  final _infoStrings = <String>[];
  RtcEngine _engine;
  bool muted = false;
  bool _isLogin = false;
  bool _isInChannel = false;
  bool message = true;
  final _channelMessageController = TextEditingController();

  final _info = <String>[];

  AgoraRtmClient _client;
  AgoraRtmChannel _channel;

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

  void _createClient() async {
    _client =
        await AgoraRtmClient.createInstance("6efcbe6ffce7439ebba67a7c547846e3");
    _client.onMessageReceived = (AgoraRtmMessage message, String peerId) {
      _logPeer(message.text);
    };
    _client.onConnectionStateChanged = (int state, int reason) {
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

  Widget endCall() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: IconButton(
          icon: Icon(
            Icons.call_end,
            color: Colors.redAccent,
            size: 40.0,
          ),
          onPressed: () => _onCallEnd(context)),
    );
  }

  Widget unMute() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: IconButton(
        icon: Icon(
          muted ? Icons.mic_off : Icons.mic,
          color: Color(0xFF3BACCF),
          size: 30.0,
        ),
        onPressed: _onToggleMute,
      ),
    );
  }

  Widget swicthCamera() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: IconButton(
        icon: Icon(
          Icons.switch_camera,
          color: Color(0xFF3BACCF),
          size: 30.0,
        ),
        onPressed: _onSwitchCamera,
      ),
    );
  }

  Widget _toggleMessage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: IconButton(
        icon: Icon(
          Icons.message_outlined,
          color: Color(0xFF3BACCF),
          size: 30.0,
        ),
        onPressed: _onToggleMessage,
      ),
    );
  }

  List<Widget> _getRenderViews() {
    final List<StatefulWidget> list = [];
    if (widget.isBroadcaster) {
      list.add(RtcLocalView.SurfaceView());
    }
    _users.forEach((int uid) => list.add(RtcRemoteView.SurfaceView(uid: uid)));
    return list;
  }

  Widget _videoView(view) {
    return Expanded(child: Container(child: view));
  }

  Widget _expandedVideoRow(List<Widget> views) {
    final wrappedViews = views.map<Widget>(_videoView).toList();
    return Expanded(
      child: Row(
        children: wrappedViews,
      ),
    );
  }

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

  Widget messageBox() {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.55,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF3BACCF)),
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            width: MediaQuery.of(context).size.width * 0.4,
            child: TextFormField(
              //showCursor: true,
              //enableSuggestions: true,
              textCapitalization: TextCapitalization.sentences,
              controller: _channelMessageController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.white70,
                hoverColor: Colors.white70,
                focusColor: Colors.white70,
                labelStyle: TextStyle(
                  color: Colors.cyan,
                ),
                hintText: 'Comment...',
                hintStyle: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.bold),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0)),
                ),
              ),
            ),
          ),
          sendButton()
        ],
      ),
    );
  }

  Widget sendButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: IconButton(
        icon: Icon(Icons.send, color: Color(0xFF3BACCF)),
        onPressed: _toggleSendChannelMessage,
      ),
    );
  }

  Widget _buildSendChannelMessage() {
    if (!_isLogin || !_isInChannel) {
      return Container();
    }
    return widget.isBroadcaster
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              swicthCamera(),
              unMute(),
              endCall(),
              Padding(
                padding: const EdgeInsets.only(right: 4),
              ),
              messageBox(),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _toggleMessage(),
              messageBox(),
              unMute(),
              endCall(),
            ],
          );
  }

  Widget _buildInfoList() {
    return Expanded(
      child: Container(
        //color: Colors.cyan.withOpacity(0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.1),
            Colors.black.withOpacity(0.4),
          ],
        )),
        child: (_info.length > 0 && message == true)
            ? ListView.builder(
                reverse: true,
                itemBuilder: (context, i) {
                  var tmp = _info[i].split("%");
                  return Container(
                    child: ListTile(
                      title: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          color: Colors.grey.withOpacity(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tmp[1],
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white54,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                tmp[0],
                                maxLines: 10,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: _info.length,
              )
            : Container(),
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
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.1),
                    ],
                  )),
                ),
                _buildInfoList(),
                Container(
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.8),
                    ],
                  )),
                  alignment: Alignment.bottomLeft,
                  child: _buildSendChannelMessage(),
                ),
              ],
            ),
            //_toolbar()
          ],
        ),
      ),
    );
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

  void _onCallEnd(BuildContext context) {
    if (widget.isBroadcaster == false) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => RatingScreen()));
    } else if (widget.isBroadcaster == true) {
      Navigator.pop(context);
    }
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

  void _onToggleMessage() {
    setState(() {
      message = !message;
    });
  }

  Future<AgoraRtmChannel> _createChannel(String name) async {
    AgoraRtmChannel channel = await _client.createChannel(name);
    channel.onMemberJoined = (AgoraRtmMember member) {
      print(
          "Member joined: " + member.userId + ', channel: ' + member.channelId);
    };
    channel.onMemberLeft = (AgoraRtmMember member) {
      print("Member left: " + member.userId + ', channel: ' + member.channelId);
    };
    channel.onMessageReceived =
        (AgoraRtmMessage message, AgoraRtmMember member) {
      _logPeer(message.text);
    };
    return channel;
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

  void _logPeer(String info) {
    print(info);
    setState(() {
      _info.insert(0, info + "%" + widget.userName);
    });
  }

  void _log(String info) {
    print(info);
    setState(() {
      _info.insert(0, info + "%" + widget.userName);
    });
  }
}
