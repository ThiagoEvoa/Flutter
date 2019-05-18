import 'package:estudo_flutter/ui/home.dart';
import 'package:estudo_flutter/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _getSharedPreferences() async {
      return await SharedPreferences.getInstance();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: _getSharedPreferences(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.getBool("isLogged") == true) {
              return Home();
            } else {
              return Login();
            }
          } else {
            return Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
