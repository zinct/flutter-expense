import 'package:expense/model/transaction.dart';
import 'package:expense/transaction/transaction_form.dart';
import 'package:expense/transaction/transaction_list.dart';
import 'package:flutter/material.dart';

class TransactionContainer extends StatefulWidget {
  @override
  _TransactionContainerState createState() => _TransactionContainerState();
}

class _TransactionContainerState extends State<TransactionContainer> {
  final List<Transaction> transactions = [
    Transaction(
        id: 1, name: 'Bought Ice cream', amount: 5000, date: DateTime.now()),
    Transaction(
        id: 2,
        name: 'Pay telkom administrator',
        amount: 400000,
        date: DateTime.now()),
  ];

  void handleCreateTransaction(data) {
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(handleCreateTransaction),
        TransactionList(transactions),
      ],
    );
  }
}
