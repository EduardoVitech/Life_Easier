import 'package:flutter/material.dart';

class Graphic extends StatelessWidget {
  const Graphic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Card(
        elevation: 5,
        color: Colors.blue,
        child: Text('Gráfico'),
      ),
    );
  }
}
