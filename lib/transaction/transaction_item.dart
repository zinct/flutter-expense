import 'dart:math';

import 'package:expense/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction _transaction;
  final Function()? _onDelete;

  TransactionItem(this._transaction, this._onDelete);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 2)),
          child: FittedBox(
              child: Text(
            _transaction.name[0],
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
        title: Text(
          _transaction.name,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(DateFormat.yMMMd().format(_transaction.date) +
            '\nRp. ${_transaction.amount.toString()}'),
        isThreeLine: true,
        trailing: IconButton(
          icon: Icon(
            Icons.remove_circle_outline,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: _onDelete,
        ),
      ),
    );
  }
}
