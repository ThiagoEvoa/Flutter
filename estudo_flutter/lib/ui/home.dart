import 'package:estudo_flutter/controller/drawer_controller.dart';
import 'package:estudo_flutter/widget/custom_drawer.dart';
import 'package:estudo_flutter/widget/custom_pageview.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return CustomDrawerController(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        drawer: CustomDrawer(),
        body: Center(
          child: CustomPageView(),
        ),
      ),
    );
  }
}
