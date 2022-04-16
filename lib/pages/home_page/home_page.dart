import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: const Card(
              elevation: 5,
              color: Colors.blue,
              child: Text('Gráfico'),
            ),
          ),
          const Card(
            child: Text('Lista de Transações'),
          ),
        ],
      ),
    );
  }
}
