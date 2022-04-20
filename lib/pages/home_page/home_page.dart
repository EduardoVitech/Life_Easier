import 'package:flutter/material.dart';
import 'package:life_easier/components/graphic/graphic.dart';
import 'package:life_easier/components/new_transaction/new_transaction.dart';
import 'package:life_easier/components/transaction_list/transaction_list.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Despesas Pessoais',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Grafico
          const Graphic(),

          // Lista de transações
          TransactionList(),

          // Add nova transação
          const NewTransaction(),
        ],
      ),
    );
  }
}
