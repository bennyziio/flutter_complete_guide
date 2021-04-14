import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // pjh20210412 transaction
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];
  // pjh20210413 bad practice
  // String titleInput;
  // String amountInput;
  // pjh20210413 Solution
  final titleController = TextEditingController();
  final amountcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
        // pjh20210413 mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: const Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('CHART!'),
            ),
          ),
          // pjh20210413
          Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(labelText: 'Title'),
                    controller: titleController,
                    // pjh20210413 bad practice
                    // onChanged: (val) {
                    //   titleInput = val;
                    // },
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Amount'),
                    controller: amountcontroller,
                    // pjh20210413 bad practice
                    // onChanged: (val) => amountInput = val,
                  ),
                  FlatButton(
                    textColor: Colors.purple,
                    onPressed: () {
                      // pjh20210413 solution
                      print(titleController.text);
                      // pjh20210413 bad practice
                      // print(titleInput);
                      // print(amountInput);
                    },
                    child: const Text('Add Transaction'),
                  ),
                ],
              ),
            ),
          ),
          Column(
            // pjh20210412 transaction
            children: transactions.map((tx) {
              return Card(
                // pjh20210412 Container and Column in a Row
                child: Row(
                  children: <Widget>[
                    Container(
                      // pjh20210412 Container margin setting
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        // pjh20210413
                        // add $ as a character put \ in front of $
                        // and curly braclet acts as a string
                        '\$${tx.amount}',
                        // pjh20210412 TextStyle
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    // pjh20210412 column decoration
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          // pjh20210413
                          // DateFormat Patterns
                          // look more nicer date format
                          DateFormat.yMMMMd().format(tx.date),
                          // pjh20210413 tx.date.toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
