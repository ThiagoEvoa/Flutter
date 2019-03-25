import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  final _emailFieldFocus = FocusNode();

  _login() {
    if (_emailFieldController.text.isEmpty) {
      FocusScope.of(context).requestFocus(_emailFieldFocus);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: _emailFieldController,
                  focusNode: _emailFieldFocus,
                  cursorColor: Theme.of(context).hintColor,
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                  ),
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: TextStyle(color: Theme.of(context).hintColor),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).accentColor)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: _passwordFieldController,
                  cursorColor: Theme.of(context).hintColor,
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Theme.of(context).hintColor),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).accentColor)),
                  ),
                ),
              ),
              RaisedButton(
                child: Text(
                  'login',
                  style: TextStyle(color: Theme.of(context).hintColor),
                ),
                color: Theme.of(context).accentColor,
                onPressed: _login,
              ),
            ],
          ),
        ));
  }
}
