import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class TrasactionList extends StatelessWidget {
  final List<Transaction> _trans;
  final Function deletetx;
  TrasactionList(this._trans, this.deletetx);

  @override
  Widget build(BuildContext context) {
    return _trans.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) => Column(
              children: <Widget>[
                Text("No expenses has been added yet."),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/box.jpg",
                  height: constraints.maxHeight * 0.6,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: _trans.length,
            itemBuilder: (ctx, index) => Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: FittedBox(
                      child: Text(
                        _trans[index].itemprice.toString(),
                      ),
                    ),
                  ),
                ),
                title: Text(_trans[index].itemname),
                subtitle: Text(DateFormat.yMMMEd().format(_trans[index].date)),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () {
                    deletetx(_trans[index].id);
                  },
                ),
              ),
            ),
          );
  }
}
