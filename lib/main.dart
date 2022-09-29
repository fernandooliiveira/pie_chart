import 'package:flutter/material.dart';
import 'package:pie_chart/pages/custom_paint_example.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home: CustomPaintExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}