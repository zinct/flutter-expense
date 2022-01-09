import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final Function _onSubmit;

  final _nameController = TextEditingController();
  final _amountController = TextEditingController();

  TransactionForm(this._onSubmit);

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
              decoration: InputDecoration(labelText: 'Masukan nama...'),
              controller: _nameController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Masukan nominal...'),
              controller: _amountController,
            ),
            TextButton(
                onPressed: () => _onSubmit(
                    _nameController.text, double.parse(_amountController.text)),
                child: Text('Tambah pengeluaran'))
          ],
        ),
      ),
    );
  }
}
