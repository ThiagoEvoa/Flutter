import 'dart:convert';

import 'package:estudo_flutter/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScheduleList extends StatefulWidget {
  @override
  _ScheduleListState createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  List list = [];

  Future<List<dynamic>> _retrieveSchedules() async {
    http.Response response;
    response = await http.get(url_schedule);

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();

    _retrieveSchedules().then((result) {
      setState(() {
        list = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _retrieveSchedules(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return Container(
              width: 200.0,
              height: 200.0,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor),
                strokeWidth: 5.0,
              ),
            );
          default:
            return Container(
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 1.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(list[index]["date"]),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(list[index]["initialTime"]),
                                      Padding(
                                        padding: EdgeInsets.only(right: 50.0),
                                      ),
                                      Text(list[index]["finalTime"]),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Client: ${list[index]["clientId"]}"),
                                    Text("Professional: ${list[index]["professionalId"]}")
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Theme.of(context).primaryColor,
                          )
                        ],
                      );
                    }));
        }
      },
    );
  }
}
