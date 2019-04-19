import 'package:estudo_flutter/model/person.dart';
import 'package:estudo_flutter/ui/detail_page.dart';
import 'package:flutter/material.dart';

class CustomList extends StatefulWidget {
  final List list;

  const CustomList({this.list});

  @override
  _CustomListState createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Person.get();
      },
      child: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Dismissible(
                key: Key(Person.fromJson(widget.list[index]).id),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  Person.delete(Person.fromJson(widget.list[index]));
                  setState(() {
                    widget.list.remove(widget.list[index]);
                  });
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("Item removed.")));
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
                        builder: (context) => DetailPage(
                            person: Person.fromJson(widget.list[index])),
                      ),
                    );
                  },
                  title: Text(
                    Person.fromJson(widget.list[index]).name,
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
