import './transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
      id: "t1",
      title: "New Shoes",
      amount: 69.9,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Weekly Groceries",
      amount: 56,
      date: DateTime.now(),
    )
  ];

  // String titleInput;
  // String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter App")),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Container(width: 100, child: Text("CHART!")),
              elevation: 5,
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: titleController,
                    // onChanged: (val) => titleInput = val,
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    controller: amountController,
                    // onChanged: (val) => amountInput = val,
                    decoration: InputDecoration(labelText: 'Amount'),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text("Add Transaction"),
                    textColor: Colors.purple,
                  )
                ],
              ),
            ),
          ),
          Column(
              children: transaction.map((tx) {
            return Card(
                child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2)),
                  child: Text(
                    '\$${tx.amount}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tx.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd').format(tx.date),
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ));
          }).toList())
        ],
      ),
    );
  }
}
