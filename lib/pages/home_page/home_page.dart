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
  final List<Transaction> _transactions = [];
  bool _showGraphic = false;

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransactions(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
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
    bool _isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar = AppBar(
      title: const Text('Despesas Pessoais'),
      actions: [
        if (_isLandscape)
          IconButton(
            onPressed: () {
              setState(() {
                _showGraphic = !_showGraphic;
              });
            },
            icon: Icon(_showGraphic ? Icons.list : Icons.show_chart),
          )
      ],
    );

    final availabelHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //if (_isLandscape)
            //  Row(
            //    mainAxisAlignment: MainAxisAlignment.center,
            //    children: [
            //      const Text('Exibir Grafico'),
            //      Switch(
            //        value: _showGraphic,
            //        onChanged: (value) {
            //          setState(() {
            //            _showGraphic = value;
            //          });
            //        },
            //      ),
            //    ],
            //  ),
            if (_showGraphic || !_isLandscape)
              Container(
                height: availabelHeight * (_isLandscape ? 0.8 : 0.3),
                child: Graphic(_recentTransactions),
              ),
            if (!_showGraphic || !_isLandscape)
              Container(
                height: availabelHeight * (_isLandscape ? 1 : 0.7),
                child: TransactionList(_transactions, _removeTransactions),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
