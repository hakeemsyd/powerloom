import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:powerloom/taar.calculator.dart';
import 'package:powerloom/calculator.model.dart';

class MyHomePage extends StatefulWidget {
  List<Calculator> calculators;

  MyHomePage({Key key, this.title, @required this.calculators})
      : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      widget.calculators;
    });
  }

  void _onTapListView(Calculator calculator, int index) {
    Fluttertoast.showToast(
        msg: 'clicked: $calculator', toastLength: Toast.LENGTH_SHORT);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text(calculator.name()),
            content: Form(
              key: _formKey,
              child: TaarCalculator(calculator: calculator),
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
                  setState(() {
                    calculators[index] = calculator;
                  });
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
                title: Text(widget.calculators[index].name()),
                subtitle: Text(
                    'Results:' + widget.calculators[index].result.toString()),
                onTap: () => _onTapListView(widget.calculators[index], index),
              );
            },
            itemCount: widget.calculators.length),
      ),
    );
  }
}
