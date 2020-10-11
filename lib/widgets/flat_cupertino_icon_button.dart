import 'package:flutter/cupertino.dart';

class FlatCupertinoIconButton extends StatelessWidget {
  FlatCupertinoIconButton(
      {@required this.onPressed, @required this.text, @required this.icon});

  final String text;
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: CupertinoTheme.of(context).barBackgroundColor,
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: CupertinoTheme.of(context).barBackgroundColor,
            ),
          ),
        ],
      ),
      onPressed: this.onPressed,
    );
  }
}