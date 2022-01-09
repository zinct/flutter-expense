import 'package:flutter/material.dart';
import 'package:expense/transaction/transaction_container.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Expense APP'),
          ),
          body: Column(
            children: [
              Card(
                color: Colors.amber,
                child: Container(
                  width: double.infinity,
                  height: 100,
                  child: Text('Chart'),
                ),
              ),
              TransactionContainer(),
            ],
          )),
    );
  }
}
