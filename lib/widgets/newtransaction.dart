import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addnewtransaction;
  NewTransaction(this.addnewtransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final itemnamecontroller = TextEditingController();
  final itempricecontroller = TextEditingController();

//submitting transdata
  void submittrans() {
    final itemname = itemnamecontroller.text;
    final itemprice = double.parse(itempricecontroller.text);
    if (itemname.isEmpty || itemprice < 0) {
      return;
    }
    itemnamecontroller.clear();
    itempricecontroller.clear();

    widget.addnewtransaction(itemname, itemprice);
    Navigator.pop(context);
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
              TextField(
                decoration: InputDecoration(labelText: "Date"),
                onChanged: (value) {},
              ),
              RaisedButton(
                onPressed: submittrans,
                color: Colors.blue,
                child: Text("Add"),
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
