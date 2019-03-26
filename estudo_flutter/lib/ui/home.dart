import 'package:estudo_flutter/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pageController = PageController();
  List list = ["item1", "item2", "item3"];

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              "Schedules",
              style: TextStyle(color: Theme.of(context).hintColor),
            ),
          ),
          body: Scaffold(
            body: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index){
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 1.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(list[index]),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(list[index]),
                                Padding(padding: EdgeInsets.only(right: 50.0),),
                                Text(list[index]),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("${list[index]}: ${list[index]}"),
                                Text("${list[index]}: ${list[index]}")
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Theme.of(context).primaryColor,)
                    ],
                  );
                }
            ),
          ),
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}
