import 'package:expense/model/transaction.dart';
import 'package:expense/transaction/transaction_item.dart';
import 'package:expense/widgets/not_found.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 355,
        child: transactions.isNotEmpty
            ? ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) =>
                    TransactionItem(transactions[index]),
              )
            : NotFound(
                padding: EdgeInsets.only(top: 50),
              ));
  }
}
