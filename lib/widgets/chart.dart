import 'package:expense_tracker/model/transaction.dart';
import 'package:expense_tracker/widgets/ChartBar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recenttrans;
  Chart(this.recenttrans);

  //grouped by day

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      return {'day': "Sun", 'amount': index.toString()};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((tx) => ChartBar()).toList()),
    );
  }
}
