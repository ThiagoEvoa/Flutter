import 'package:estudo_flutter/controller/drawer_controller.dart';
import 'package:estudo_flutter/ui/login.dart';
import 'package:estudo_flutter/util/constants.dart';
import 'package:estudo_flutter/util/user_firebase.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CustomDrawerController _controller =
        CustomDrawerController.of(context);

    _getSharedPreferences() async {
      return await SharedPreferences.getInstance();
    }

    return StreamBuilder<int>(
        stream: CustomDrawerController.of(context).output,
        builder: (context, snapshot) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.person,
                              color: Theme.of(context).primaryColor,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "My Flutter demo",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "My app",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  selected: snapshot.data == homePage,
                  onTap: () {
                    _controller.input.add(homePage);
                    Scaffold.of(context).openEndDrawer();
                  },
                  leading: Icon(
                    Icons.home,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text("Home"),
                ),
                ListTile(
                  selected: snapshot.data == aboutPage,
                  onTap: () {
                    _controller.input.add(aboutPage);
                    Scaffold.of(context).openEndDrawer();
                  },
                  leading: Icon(
                    Icons.account_box,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text("About"),
                ),
                FutureBuilder(
                  future: _getSharedPreferences(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return ListTile(
                      onTap: () {
                        UserFirebase().signOut().then((result) {
                          snapshot.data.setBool("isLogged", false);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        });
                      },
                      leading: Icon(
                        Icons.exit_to_app,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text("Exit"),
                    );
                  },
                ),
              ],
            ),
          );
        });
  }
}
