import 'package:flutter/material.dart';
import 'model.dart';

class TodoAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoAddState();
  }
}

class TodoAddState extends State<StatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _subject = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Subject'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _subject,
                  decoration: InputDecoration(labelText: 'Subject'),
                  validator: (value){
                    if(value.isEmpty){
                      return "Please fill subject";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text('Save'),
                  onPressed: () {
                    _formKey.currentState.validate();
                    if (_subject.text.isNotEmpty) {             
                      FirestoreUtils.addTask(_subject.text);
                      Navigator.pop(context, true);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}