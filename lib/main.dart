import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/newtransaction.dart';
import 'package:flutter/material.dart';
import './model/transaction.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.brown,
        accentColor: Colors.green,
        fontFamily: "pt",
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            title: TextStyle(
              fontFamily: "pt",
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      home: ExpensePage(),
    );
  }
}

class ExpensePage extends StatefulWidget {
  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  List<Transaction> _usertrans = [
    // Transaction(itemname: "watch", itemprice: 200.0, date: DateTime.now()),
    // Transaction(itemname: "Jacket", itemprice: 1200.0, date: DateTime.now()),
    // Transaction(itemname: "Groceries", itemprice: 2000.0, date: DateTime.now()),
  ];

  void _showaddtransaction(BuildContext bctx) {
    showModalBottomSheet(
        context: bctx, builder: (ctx) => NewTransaction(_addnewtransaction));
  }

  void _addnewtransaction(String itemname, double itemprice, DateTime date) {
    setState(() {
      _usertrans.add(
          Transaction(itemname: itemname, itemprice: itemprice, date: date));
    });
  }

  List<Transaction> get _recentTransactions {
    return _usertrans.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  bool _showChart = false;

  @override
  Widget build(BuildContext context) {
    final mediaConst = MediaQuery.of(context);
    final isLandScape = mediaConst.orientation == Orientation.landscape;

    final appBar = AppBar(
      title: Text("Expenses Tracker"),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if (isLandScape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Show Chart"),
                  Switch(
                    value: _showChart,
                    onChanged: (bool value) {
                      setState(() {
                        _showChart = value;
                      });
                    },
                  )
                ],
              ),
            if (!isLandScape)
              Container(
                  height: mediaConst.size.height * 0.3 -
                      mediaConst.padding.top -
                      appBar.preferredSize.height,
                  child: Chart(_recentTransactions)),
            if (!isLandScape) TrasactionList(_usertrans),
            if (isLandScape)
              _showChart
                  ? Container(
                      height: mediaConst.size.height * 0.7 -
                          mediaConst.padding.top -
                          appBar.preferredSize.height,
                      child: Chart(_recentTransactions))
                  : TrasactionList(_usertrans),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showaddtransaction(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
