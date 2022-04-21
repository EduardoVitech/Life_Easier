import 'dart:math';

import 'package:flutter/material.dart';
import 'package:life_easier/components/new_transaction/new_transaction.dart';
import 'package:life_easier/components/transaction_list/transaction_list.dart';
import '../../models/transaction/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Comida',
      value: 120.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Ovo de pascoa',
      value: 35.00,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
