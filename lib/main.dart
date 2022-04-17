import 'package:flutter/material.dart';
import 'package:life_easier/pages/home_page/home_page.dart';

main() => runApp(const LifeEasierApp());

class LifeEasierApp extends StatelessWidget {
  const LifeEasierApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
