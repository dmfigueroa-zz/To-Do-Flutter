import 'package:f_202010_todo_class/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:f_202010_todo_class/widgets/custom_dropdown.dart';

class CustomAlertDialog extends StatefulWidget {
  @override
  NewCustomAlertDialog createState() => NewCustomAlertDialog();
}

class NewCustomAlertDialog extends State<CustomAlertDialog> {
  final controllerTitle = new TextEditingController();
  final controllerBody = new TextEditingController();
  String dropDownValue = 'Default';
  String selected;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      title: Text('New todo',
          style:
              TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0)),
      content: Container(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          TextField(
            autofocus: true,
            controller: controllerTitle,
            decoration: InputDecoration(
                labelText: 'Title', hintText: 'This is a title'),
          ),
          TextField(
            controller: controllerBody,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: new InputDecoration(
                labelText: 'Body', hintText: 'This is Sparta'),
          ),
          StatelessDropdown(
            selected: dropDownValue,
            onChangedValue: (newValue) => setState(() {
              dropDownValue = newValue;
            }),
          ),
        ]),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            controllerTitle.clear();
            controllerBody.clear();
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
            child: Text('Add'),
            onPressed: () {
              final todo = new Todo(
                  title: controllerTitle.value.text,
                  body: controllerBody.value.text,
                  completed: 0,
                  icon: dropDownValue);
              controllerTitle.clear();
              controllerBody.clear();
              Navigator.of(context).pop(todo);
            })
      ],
    );
  }
}
