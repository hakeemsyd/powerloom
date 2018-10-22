List<Calculator> calculators = [
  Calculator(CalculatorType.TaarCalc),
  Calculator(CalculatorType.KonCalc),
  Calculator(CalculatorType.TotalCalc),
];

enum CalculatorType {
  TaarCalc,
  KonCalc,
  TotalCalc,
}

class Calculator {
  CalculatorType type;
  double result;
  int value1;
  double value2;

  //List<double> values;

  Calculator(CalculatorType type) {
    this.type = type;
    result = 0.0;
    value1 = 0;
    value2 = 0.0;
  }

  String name() {
    switch (type) {
      case CalculatorType.KonCalc:
        return "Kon Calculator";
        break;
      case CalculatorType.TaarCalc:
        return "Taar Calculator";
        break;
      case CalculatorType.TotalCalc:
        return "Total Calculator";
        break;
      default:
        return "Unknown";
        break;
    }
  }
}
