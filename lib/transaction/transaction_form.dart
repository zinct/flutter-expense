import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final Function _onSubmit;

  TransactionForm(this._onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();

  void _handleSubmit() {
    widget._onSubmit(
        _nameController.text, double.parse(_amountController.text));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
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
            TextButton(
                onPressed: _handleSubmit, child: Text('Create Transaction'))
          ],
        ),
      ),
    );
  }
}
