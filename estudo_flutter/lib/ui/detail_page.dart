import 'package:estudo_flutter/model/person.dart';
import 'package:estudo_flutter/widget/custom_raisedbutton.dart';
import 'package:estudo_flutter/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Person person;

  const DetailPage({this.person});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController(text: widget.person?.name);

    return Scaffold(
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
              clicked: () {
                if (widget.person == null) {
                  Person.save(Person(name: _controller.text));
                } else {
                  widget.person.name = _controller.text;
                  Person.save(widget.person);
                }
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
