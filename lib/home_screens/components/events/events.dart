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
      duration: Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(child: child, scale: animation);
      },
      child: Container(
        height: 192,
        margin: const EdgeInsets.only(
          top: 8,
          bottom: 40,
          right: 16,
          left: 16,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFF4EAFC1),
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
