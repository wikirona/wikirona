import 'package:flutter/material.dart';

class AddPatient extends StatefulWidget {
  @override
  _AddPatientState createState() {
    return _AddPatientState();
  }
}

class _AddPatientState extends State<AddPatient> {
  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    switch (screenIndex) {
      case 0:
        return NameScreen(onNext: () {
          setState(() {
            screenIndex = 1;
          });
        });
    }
    throw 'Invalid screen index';
  }
}

class NameScreen extends StatefulWidget {
  final Function onNext;

  NameScreen({this.onNext});

  @override
  _NameScreenState createState() {
    return _NameScreenState();
  }
}

const ETHNICITIES = <String>['Asian', 'Black', 'Mixed', 'Other', 'White'];

class _NameScreenState extends State<NameScreen> {
  final _formKey = GlobalKey<FormState>();

  String gender;
  String ethnicity; // = 'Select';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(title: Text('New Patient')),
        body: Form(
            key: _formKey,
            child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Name'),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Patient ID'),
                      ),
                      SizedBox(height: 30),
                      Text('Gender'),
                      RadioListTile(
                          title: const Text('Male'),
                          value: 'Male',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value;
                            });
                          }),
                      RadioListTile(
                          title: const Text('Female'),
                          value: 'Female',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value;
                            });
                          }),
                      RadioListTile(
                          title: const Text('Other'),
                          value: 'Other',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value;
                            });
                          }),
                      SizedBox(height: 30),
                      Text('Ethnicity'),
                      DropdownButton(
                          value: ethnicity,
                          onChanged: (value) {
                            setState(() {
                              ethnicity = value;
                            });
                          },
                          items: ETHNICITIES
                              .map<DropdownMenuItem<String>>((String value) {
                            // return null;
                            return DropdownMenuItem<String>(
                                value: value, child: Text(value));
                          }).toList()),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: RaisedButton(
                                  color: Colors.green[400],
                                  textColor: Colors.white,
                                  child: Text('Next',
                                      style: TextStyle(fontSize: 18.0)),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      widget.onNext();
                                    }
                                  }))
                        ],
                      )
                    ]))));
  }
}
