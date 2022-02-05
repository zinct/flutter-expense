import 'package:flutter/material.dart';

class ChartBart extends StatelessWidget {
  final String _label;
  final double _spendingAmount;
  final double _maxPrice;

  const ChartBart(this._label, this._spendingAmount, this._maxPrice, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Text('\$${_spendingAmount.toStringAsFixed(0)}'),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 15,
          height: 65,
          color: Colors.grey[200],
          child: FractionallySizedBox(
            heightFactor:
                _spendingAmount > 0 ? _spendingAmount / _maxPrice * 1 : 0,
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(_label),
      ],
    );
  }
}
