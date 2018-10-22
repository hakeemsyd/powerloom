import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var calculators = ["Taar Counter", "Kon Counter", "Final Counter"];

  void _incrementCounter() {
    setState(() {});
  }

  void _onTapListView(String calculator) {
    Fluttertoast.showToast(msg: 'clicked: $calculator' , toastLength: Toast.LENGTH_SHORT);
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Hello')));
    // showDialog(context: context);
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
