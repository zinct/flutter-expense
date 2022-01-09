import 'package:expense/model/transaction.dart';
import 'package:expense/transaction/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 355,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) => TransactionItem(transactions[index]),
      ),
    );
  }
}
