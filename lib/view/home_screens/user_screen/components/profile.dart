import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.press,
  }) : super(key: key);

  final String text;
  final Icon icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 72,
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 16,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(0),
        child: TextButton(
          onPressed: press,
          child: Row(
            children: [
              icon,
              Container(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Color(0xFF477983),
                    fontSize: 20,
                  ),
                ),
                margin: const EdgeInsets.only(left: 5.0),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF477983),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
