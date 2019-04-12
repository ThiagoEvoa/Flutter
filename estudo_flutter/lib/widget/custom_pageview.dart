
import 'package:estudo_flutter/controller/drawer_controller.dart';
import 'package:estudo_flutter/ui/about_page.dart';
import 'package:estudo_flutter/ui/list_page.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatelessWidget {
  final pages = <Widget>[
    ListPage(),
    AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: CustomDrawerController.of(context).output,
      builder: ((context, snapshot) {
        return PageView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[pages[snapshot.data]],
        );
      }),
    );
  }
}
