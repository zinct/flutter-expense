import 'package:expense/model/transaction.dart';
import 'package:expense/transaction/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((row) => TransactionItem(row)).toList(),
    );
  }
}
