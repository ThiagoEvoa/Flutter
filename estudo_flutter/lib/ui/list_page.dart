import 'package:estudo_flutter/model/person.dart';
import 'package:estudo_flutter/ui/detail_page.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  _showSnackBar(String text) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).primaryColor,
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

  _delete(List list, int index) {
    Person.delete(Person.fromJson(list[index])).catchError((error) {
      _showSnackBar("Error while deleting person.");
    }).then(((result) {
      setState(() {
        list.remove(list[index]);
      });
      _showSnackBar(result);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: Person.fetch(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return customList(
                snapshot.data,
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "${snapshot.error} ",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          ScaffoldState().reassemble();
                        });
                      },
                      icon: Icon(
                        Icons.refresh,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                await Person.fetch();
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

  Widget customList(List list) {
    return RefreshIndicator(
      onRefresh: () async {
        await Person.fetch();
      },
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Dismissible(
                key: Key(Person.fromJson(list[index]).id),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  _delete(list, index);
                },
                background: Container(
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(person: Person.fromJson(list[index])),
                      ),
                    );
                  },
                  title: Text(
                    Person.fromJson(list[index]).name,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              Divider(
                height: 2,
                color: Theme.of(context).primaryColor,
              ),
            ],
          );
        },
      ),
    );
  }
}
