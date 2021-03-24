import 'dart:async';
import 'package:flutter/material.dart';

class EventElements extends StatefulWidget {
  const EventElements({Key key, this.images}) : super(key: key);
  final List<String> images;

  @override
  _EventElements createState() => _EventElements();
}

class _EventElements extends State<EventElements>
    with TickerProviderStateMixin {
  int _index = 0;
  Timer _timer;
  Duration _duration = Duration(seconds: 1);

  @override
  void initState() {
    _timer = Timer.periodic(_duration, (Timer timer) {
      setState(() {
        _index = _index == widget.images.length - 1 ? 0 : _index + 1;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(seconds: 1),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(child: child, opacity: animation);
      },
      child: Container(
        width: 300,
        height: 185,
        margin: const EdgeInsets.only(
          top: 8,
          bottom: 40,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFFFFEADE),
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(widget.images[_index]),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
