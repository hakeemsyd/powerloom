import 'package:flutter/material.dart';
import 'package:powerloom/home.page.dart';
import 'package:powerloom/calculator.model.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Power Loom',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Power Loom Counters', calculators:  calculators,),
    );
  }
}
