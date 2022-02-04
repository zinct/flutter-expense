import 'package:expense/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactions;

  dynamic get recentTransactions {
    DateTime week = DateTime.now().subtract(Duration(days: 7));

    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index + 1));

      double total = 0;
      for (int i = 0; i < transactions.length; i++) {
        if (transactions[i].date.day == weekDay.day &&
            transactions[i].date.month == weekDay.month &&
            transactions[i].date.year == weekDay.year)
          total += transactions[i].amount;
      }

      return {'name': DateFormat.E('id_ID').format(weekDay), 'total': total};
    });
  }

  const Chart({Key? key, required this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(recentTransactions);
    return Card(
      child: Container(
        height: 100,
        width: double.infinity,
        child: Text("This is chart"),
      ),
    );
  }
}
