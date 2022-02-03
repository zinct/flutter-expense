import 'package:expense/model/transaction.dart';
import 'package:expense/transaction/transaction_form.dart';
import 'package:expense/transaction/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:expense/transaction/transaction_container.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Transaction> transactions = [
    Transaction(
        id: 1, name: 'Bought Ice cream', amount: 45.01, date: DateTime.now()),
    Transaction(
        id: 2,
        name: 'Pay telkom administrator',
        amount: 99.95,
        date: DateTime.now()),
    // Transaction(
    //     id: 2,
    //     name: 'Pay telkom administrator',
    //     amount: 400000,
    //     date: DateTime.now()),
    // Transaction(
    //     id: 2,
    //     name: 'Pay telkom administrator',
    //     amount: 400000,
    //     date: DateTime.now()),
    // Transaction(
    //     id: 2,
    //     name: 'Pay telkom administrator',
    //     amount: 400000,
    //     date: DateTime.now()),
    // Transaction(
    //     id: 2,
    //     name: 'Pay telkom administrator',
    //     amount: 400000,
    //     date: DateTime.now()),
    // Transaction(
    //     id: 2,
    //     name: 'Pay telkom administrator',
    //     amount: 400000,
    //     date: DateTime.now()),
  ];

  void _openCreateTransactionModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bCtx) {
          return Container(
            child: TransactionForm(_createTransaction),
          );
        });
  }

  void _createTransaction(String name, double amount) {
    if (name.isEmpty && amount is String && amount <= 0) return;

    final newTransaction = Transaction(
        id: transactions.length + 1,
        name: name,
        amount: amount,
        date: DateTime.now());

    setState(() {
      transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense App',
      theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: 'Quicksand',
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold))),
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Expense APP'),
            actions: [
              IconButton(
                  onPressed: () => _openCreateTransactionModal(context),
                  icon: Icon(Icons.add))
            ],
          ),
          body: Column(
            children: [
              // Card(
              //   color: Colors.amber,
              //   child: Container(
              //     width: double.infinity,
              //     height: 100,
              //     child: Text('Chart'),
              //   ),
              // ),
              TransactionList(transactions),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => _openCreateTransactionModal(context),
          ),
        );
      }),
    );
  }
}
