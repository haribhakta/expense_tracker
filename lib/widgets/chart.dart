import 'package:expense_tracker/model/transaction.dart';
import 'package:expense_tracker/widgets/ChartBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recenttrans;
  Chart(this.recenttrans);

  //grouped by day

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (int i = 0; i < recenttrans.length; i++) {
        if (recenttrans[i].date.day == weekDay.day &&
            recenttrans[i].date.month == weekDay.month &&
            recenttrans[i].date.year == weekDay.year) {
          totalSum += recenttrans[i].itemprice;
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    }).reversed.toList();
  }

  //calculate total spent by day
  double get totalSpending {
    return groupedTransactions.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions
              .map((tx) => ChartBar(
                    day: tx["day"],
                    spentAmount: tx["amount"],
                    spentPercent: (tx['amount'] as double) / totalSpending,
                  ))
              .toList()),
    );
  }
}
