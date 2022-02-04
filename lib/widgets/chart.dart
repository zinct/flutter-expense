import 'package:expense/model/transaction.dart';
import 'package:expense/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactions;

  List<Map<String, Object>> get _recentTransactions {
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

  double get _maxPrice {
    return _recentTransactions.fold(
        0.0, (acc, curr) => acc + (curr['total'] as double));
  }

  const Chart({Key? key, required this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(_maxPrice);
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _recentTransactions
              .map((e) => Flexible(
                    fit: FlexFit.tight,
                    child: ChartBart(
                        e['name'].toString(), e['total'] as double, _maxPrice),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
