import 'package:flutter/material.dart';
import './add_patient.dart';

void main() {
  runApp(TrialsNetwork());
}

class TrialsNetwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'trials.network',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Menu());
  }
}

class MenuButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function getScreen;

  MenuButton({this.text, this.iconData, this.getScreen});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Colors.green[400],
        textColor: Colors.white,
        child: Row(children: <Widget>[
          Icon(iconData, color: Colors.white, size: 24.0),
          SizedBox(width: 5),
          Text(text, style: TextStyle(fontSize: 18.0))
        ]),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => getScreen()));
        });
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('trials.network')),
        body: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
          MenuButton(
              text: 'Add a Patient',
              iconData: Icons.person_add,
              getScreen: () => AddPatient()),
        ]));
  }
}
