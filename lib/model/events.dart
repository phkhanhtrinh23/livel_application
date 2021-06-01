import 'dart:async';
import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  const Events({Key key, this.images}) : super(key: key);
  final List<String> images;

  @override
  _Events createState() => _Events();
}

class _Events extends State<Events> with TickerProviderStateMixin {
  int _index = 0;
  Timer _timer;
  Duration _duration = Duration(seconds: 3);

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
      duration: _duration,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(child: child, scale: animation);
      },
      child: EventElements(
        image: widget.images[_index],
      ),
    );
  }
}

class EventElements extends StatelessWidget {
  const EventElements({Key key, this.image}) : super(key: key);

  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      width: 400,
      height: 192,
      margin: const EdgeInsets.only(
        top: 8,
        bottom: 40,
        right: 16,
        left: 16,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF4EAFC1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        child: TextButton(
          onPressed: () {},
          child: Image.asset(image),
        ),
        padding: const EdgeInsets.all(0),
      ),
    );
  }
}
