import 'package:estudo_flutter/widgets/drawer_titles.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Theme.of(context).primaryColor, Colors.blueAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(top: 16.0),
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 16.0, 16.0, 10.0),
                height: 170,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text(
                        "Study\nFlutter",
                        style: TextStyle(
                            fontSize: 34.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).hintColor),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "App de estudo",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).hintColor),
                          ),
                          Text(
                            "App de estudo com o Flutter",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).hintColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Theme.of(context).hintColor,
              ),
              DrawerTitle(Icons.home, "Schedules", pageController, 0),
              DrawerTitle(Icons.exit_to_app, "Logout", pageController, 1),
            ],
          ),
        ],
      ),
    );
  }
}
