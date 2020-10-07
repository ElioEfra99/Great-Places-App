import 'package:flutter/cupertino.dart';

class CupertinoIconButton extends StatelessWidget {
  CupertinoIconButton(
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
            color: CupertinoTheme.of(context).primaryColor,
          ),
          Text(
            text,
            style: TextStyle(
              color: CupertinoTheme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      color: CupertinoTheme.of(context).primaryContrastingColor,
      onPressed: () => onPressed,
    );
  }
}
