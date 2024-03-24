import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onDismissed;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      // For iOS
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              onDismissed();
            },
            child: Text('OK'),
          ),
        ],
      );
    } else {
      // For Android and other platforms
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              onDismissed();
            },
            child: Text('OK'),
          ),
        ],
      );
    }
  }
}
