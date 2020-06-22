import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class TrasactionList extends StatelessWidget {
  final List<Transaction> _trans;
  TrasactionList(this._trans);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
          itemCount: _trans.length,
          itemBuilder: (ctx, index) => Card(
                child: ListTile(
                  leading: Text(_trans[index].itemprice.toString()),
                  title: Text(_trans[index].itemname.toString()),
                  subtitle:
                      Text(DateFormat.yMMMEd().format(_trans[index].date)),
                  trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {}),
                ),
              )),
    );
  }
}
