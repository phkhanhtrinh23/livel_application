import 'package:flutter/material.dart';
import 'dart:ui';

class BlurryDialog extends StatelessWidget {
  //One button dialog box with blurry background
  final String title;
  final String content;
  final String buttonText;
  final VoidCallback continueCallBack;

  BlurryDialog(
      {this.title, this.content, this.buttonText, this.continueCallBack});

  final TextStyle textStyle = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: AlertDialog(
          title: Text(
            title,
            style: textStyle,
          ),
          content: Text(
            content,
            style: textStyle,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(buttonText),
              onPressed: () {
                continueCallBack();
              },
            ),
          ],
        ));
  }
}
