import 'package:flutter/material.dart';
import 'package:wyn_wyn/main.dart';

void main() => runApp(WynWyn());

class WynWyn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wyn Wyn Tasks",
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.blue,
      ),
      home: Main(),
    );
  }
}
