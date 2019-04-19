import 'dart:convert';

import 'package:estudo_flutter/model/person.dart';
import 'package:estudo_flutter/ui/detail_page.dart';
import 'package:estudo_flutter/util/constants.dart';
import 'package:estudo_flutter/widget/custom_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: Person.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CustomList(
                list: snapshot.data,
              );
            } else if (snapshot.hasError) {
              return RefreshIndicator(
                onRefresh: () async {
                  await Person.get();
                },
                child: Center(
                  child: Text("${snapshot.error}"),
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                await Person.get();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Text("Ops, we are a little empty here =/"),
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
