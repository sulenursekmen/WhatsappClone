// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.from(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)),
      child: MaterialApp(
        title: 'Whatsapp Demo',
        home: Home(),
      ),
    );
  }
}
