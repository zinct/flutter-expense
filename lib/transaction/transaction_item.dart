import 'package:expense/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  TransactionItem(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Theme.of(context).primaryColor, width: 1.5)),
          child: Text(
            transaction.amount.toString(),
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                DateFormat.yMMMMd().format(transaction.date),
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
