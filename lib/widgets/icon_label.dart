import 'package:flutter/material.dart';

class IconLabel extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconLabel({
    Key key,
    this.icon,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.schedule,
        ),
        SizedBox(
          width: 6,
        ),
        Text(text),
      ],
    );
  }
}
