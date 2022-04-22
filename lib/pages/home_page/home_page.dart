import 'dart:math';
import 'package:flutter/material.dart';
import 'package:life_easier/components/graphic/graphic.dart';
import 'package:life_easier/components/new_transaction/new_transaction.dart';
import '../../components/transaction_list/transaction_list.dart';
import '../../models/transaction/transaction.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return NewTransaction(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Graphic(),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        backgroundColor: Colors.amber.shade600,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
