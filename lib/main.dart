import 'package:flutter/material.dart';
import 'package:recipidia/Screens/home.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipidia',
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

