import 'package:expense/model/transaction.dart';
import 'package:expense/transaction/transaction_item.dart';
import 'package:expense/widgets/not_found.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(int) _onDelete;

  TransactionList(this.transactions, this._onDelete);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height - 251,
        child: transactions.isNotEmpty
            ? ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) => TransactionItem(
                    transactions[index],
                    () => _onDelete(transactions[index].id)),
              )
            : NotFound(
                padding: EdgeInsets.only(top: 50),
              ));
  }
}
