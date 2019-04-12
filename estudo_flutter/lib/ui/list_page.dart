import 'dart:convert';

import 'package:estudo_flutter/ui/detail_page.dart';
import 'package:estudo_flutter/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List list = [];

  @override
  void initState() {
    _retrievePeople().then((result) {
      setState(() {
        list = result;
      });
    });
    super.initState();
  }

  Future<List<dynamic>> _retrievePeople() async {
    final response = await http.get(url_client);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to retrieve people.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FutureBuilder(
          future: _retrievePeople(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return RefreshIndicator(
                onRefresh: _retrievePeople,
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          onTap: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => DetailPage()));
                          },
                          title: Text(list[index]["name"]),
                        ),
                        Divider(
                          height: 2,
                        ),
                      ],
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
