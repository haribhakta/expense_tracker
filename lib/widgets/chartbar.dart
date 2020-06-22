import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("\$100"),
        Container(
          height: 60,
          width: 10,
          color: Theme.of(context).primaryColor,
        ),
        Text("Sun"),
      ],
    );
  }
}
