import 'package:flutter/material.dart';

class TaarCalculator extends StatefulWidget {
  TaarCalculator();

  @override
  _TaarCalculatorState createState() => new _TaarCalculatorState();
}

class _TaarCalculatorState extends State<TaarCalculator> {
  final int TAAR_CONST = 4;
  double _result;
  int _val1;
  double _val2;

  void _onVal1Update(String val) {
    try {
      _val1 = int.parse(val);
    } catch (e) {
      _val1 = 0;
    }

    calculate();
  }

  void _onVal2Update(String val) {
    try {
      _val2 = double.parse(val);
    } catch (e) {
      _val2 = 0.0;
    }
    calculate();
  }

  void calculate() {
    setState(() => this._result = (TAAR_CONST * _val2) + _val1);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _result = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return object of type Dialog
    return new Container(
        padding: const EdgeInsets.all(40.0),
        child: new Column(
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(labelText: "Enter value1"),
              keyboardType: TextInputType.numberWithOptions(
                  signed: false, decimal: false),
              onChanged: _onVal1Update,
            ),
            new TextField(
              decoration: new InputDecoration(labelText: "Enter value 2"),
              keyboardType:
                  TextInputType.numberWithOptions(signed: false, decimal: true),
              onChanged: _onVal2Update,
            ),
            new Text('Total: $_result'),
          ],
        ));
  }
}
