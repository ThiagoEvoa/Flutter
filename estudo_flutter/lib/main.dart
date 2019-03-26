import 'package:estudo_flutter/ui/home.dart';
import 'package:flutter/material.dart';
import 'ui/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blueAccent,
        accentColor: Colors.white30,
        hintColor: Colors.white
      ),
      home: Home(),
    );
  }
}
