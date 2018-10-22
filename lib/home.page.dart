import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:powerloom/taar.calculator.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  var calculators = ["Taar Counter", "Kon Counter", "Final Counter"];

  void _onTapListView(String calculator) {
    Fluttertoast.showToast(
        msg: 'clicked: $calculator', toastLength: Toast.LENGTH_SHORT);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text(calculator),
            content: Form(
              key: _formKey,
              child: TaarCalculator(),
              autovalidate: true,
            ),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("CANCEL"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(calculators[index]),
                subtitle: Text('subtitle'),
                onTap: () => _onTapListView(calculators[index]),
              );
            },
            itemCount: calculators.length),
      ),
    );
  }
}
