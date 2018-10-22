import 'package:flutter/material.dart';
import 'package:powerloom/calculator.model.dart';

class TaarCalculator extends StatefulWidget {
  final Calculator calculator;

  TaarCalculator({this.calculator});

  @override
  _TaarCalculatorState createState() => new _TaarCalculatorState();
}

class _TaarCalculatorState extends State<TaarCalculator> {
  final int TAAR_CONST = 4;

  void _onVal1Update(String val) {
    try {
      widget.calculator.value1 = int.parse(val);
    } catch (e) {
      widget.calculator.value1 = 0;
    }

    calculate();
  }

  void _onVal2Update(String val) {
    try {
      widget.calculator.value2 = double.parse(val);
    } catch (e) {
      widget.calculator.value2 = 0.0;
    }
    calculate();
  }

  void calculate() {
    setState(() => widget.calculator.result =
        (TAAR_CONST * widget.calculator.value2) + widget.calculator.value1);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      widget.calculator.result = 0.0;
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
            new Text('Total: ' + widget.calculator.result.toString()),
          ],
        ));
  }
}
