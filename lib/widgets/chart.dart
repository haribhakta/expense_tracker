import 'package:expense_tracker/widgets/ChartBar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          ChartBar(),
          ChartBar(),
          ChartBar(),
          ChartBar(),
          ChartBar(),
          ChartBar(),
          ChartBar(),
        ],
      ),
    );
  }
}
