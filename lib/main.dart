import 'package:flutter/material.dart';
import 'package:patterns/Pages/home_page.dart';

import 'package:patterns/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pattern Printer',
      home: PatternPrinter(),
    );
  }
}
