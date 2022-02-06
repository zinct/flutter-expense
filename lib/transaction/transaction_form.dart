import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function _onSubmit;

  TransactionForm(this._onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _date;

  void _handleSubmit() {
    widget._onSubmit(
      _nameController.text,
      double.parse(_amountController.text),
      _date,
    );

    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    final DateTime currentTime = DateTime.now();
    showDatePicker(
      context: context,
      initialDate: _date ?? DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(currentTime.year + 3),
    ).then((value) {
      setState(() {
        _date = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Enter name...'),
              controller: _nameController,
              onSubmitted: (_) => _handleSubmit,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter amount...'),
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(signed: true),
              onSubmitted: (_) => _handleSubmit,
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: _showDatePicker,
                child: Text(_date == null
                    ? 'Pick date'
                    : DateFormat.yMd().format(_date!))),
            ElevatedButton(
                onPressed: _handleSubmit, child: Text('Create Transaction'))
          ],
        ),
      ),
    );
  }
}
