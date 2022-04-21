import 'package:flutter/material.dart';
import 'package:life_easier/components/graphic/graphic.dart';
import 'package:life_easier/components/transaction_user/transaction_user.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Graphic(),
            TransactionUser(),
          ],
        ),
      ),
    );
  }
}
