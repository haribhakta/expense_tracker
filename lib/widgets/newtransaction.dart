import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addnewtransaction;
  NewTransaction(this.addnewtransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final itemnamecontroller = TextEditingController();
  final itempricecontroller = TextEditingController();
  DateTime _selecteddate;

//submitting transdata
  void submittrans() {
    final itemname = itemnamecontroller.text;
    final itemprice = double.parse(itempricecontroller.text);
    if (itemname.isEmpty || itemprice < 0 || _selecteddate == null) {
      return;
    }
    itemnamecontroller.clear();
    itempricecontroller.clear();

    widget.addnewtransaction(itemname, itemprice, _selecteddate);
    Navigator.pop(context);
  }

  //to pick date
  void _pickdate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((picdate) {
      setState(() {
        _selecteddate = picdate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Item Name"),
                controller: itemnamecontroller,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Item Price"),
                controller: itempricecontroller,
                keyboardType: TextInputType.number,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selecteddate == null
                          ? "No date Choosen"
                          : "Trans Date :${DateFormat.yMEd().format(_selecteddate)}",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(children: <Widget>[
                    FlatButton(
                      child: Text(
                        "Choose date",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        _pickdate();
                      },
                    ),
                    Icon(Icons.calendar_today),
                  ]),
                ],
              ),
              RaisedButton(
                onPressed: submittrans,
                color: Colors.blue,
                child: Text("Add Transaction"),
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
