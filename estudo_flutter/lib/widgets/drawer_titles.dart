import 'package:flutter/material.dart';

class DrawerTitle extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController controller;
  final int page;

  DrawerTitle(this.icon, this.text, this.controller, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.of(context).pop();
          controller.jumpToPage(page);
        },
        child: Container(
          padding: EdgeInsets.only(left: 20.0),
          height: 50.0,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 25.0,
                color: controller.page.round() == page ? Theme.of(context).accentColor : Theme.of(context).hintColor,
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 16.0, color: controller.page.round() == page ? Theme.of(context).accentColor : Theme.of(context).hintColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
