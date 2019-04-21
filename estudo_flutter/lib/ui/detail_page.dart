import 'package:estudo_flutter/model/person.dart';
import 'package:estudo_flutter/widget/custom_raisedbutton.dart';
import 'package:estudo_flutter/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  Person person;

  DetailPage({this.person});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _showSnackBar(String text) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      backgroundColor: Theme.of(context).primaryColor,
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
      duration: Duration(seconds: 3),
    ));
  }

  _save() {
    Person.save(widget.person).catchError((error) {
      _showSnackBar(error.toString());
    }).then((result) {
      _showSnackBar(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController(text: widget.person?.name);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                controller: _controller,
                textLabel: "Name",
                color: Theme.of(context).primaryColor,
                borderSideColor: Theme.of(context).primaryColor,
                cursorColor: Theme.of(context).primaryColor,
                textColor: Theme.of(context).primaryColor,
              ),
            ),
            CustomRaisedButton(
              clicked: () async {
                if (widget.person == null) {
                  widget.person = Person(name: _controller.text);
                } else {
                  widget.person.name = _controller.text;
                }
                _save();
              },
              text: "save",
              buttonColor: Theme.of(context).accentColor,
            ),
          ],
        ),
      ),
    );
  }
}
