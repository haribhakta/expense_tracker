import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double spentAmount;
  final double spentPercent;

  ChartBar({this.day, this.spentAmount, this.spentPercent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("$spentAmount"),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: 1 - spentPercent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: spentPercent == 0
                        ? BorderRadius.circular(10)
                        : BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(day),
      ],
    );
  }
}
