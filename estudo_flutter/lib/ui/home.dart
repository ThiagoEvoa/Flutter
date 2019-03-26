import 'package:estudo_flutter/widgets/custom_drawer.dart';
import 'package:estudo_flutter/widgets/schedule_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pageController = PageController();

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
          body: Container(
            child: Center(
              child: ScheduleList(),
            ),
          ),
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}
