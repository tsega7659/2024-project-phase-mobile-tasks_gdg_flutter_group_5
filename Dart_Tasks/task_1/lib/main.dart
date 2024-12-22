import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/widgets/buttons.dart';

void main() {
  runApp(const MainApp());
}



class Calculator {
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  double divide(double a, double b) {
    if (b == 0) throw Exception("Division by zero");
    return a / b;
  }
  double modulus(double a, double b) => a % b;
  double power(double a, double b) => pow(a, b).toDouble(); // Explicitly casting to double
}


class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final Calculator _calculator = Calculator();
  double firstNum = 0;
  double secondNum = 0;
  String history = "";
  String textToDisplay = "0";
  String operation = "";
  String res = "";

  Future<void> calculateResult() async {
    await Future.delayed(const Duration(seconds: 5));
    try {
      switch (operation) {
        case '+':
          res = _calculator.add(firstNum, secondNum).toString();
          break;
        case '-':
          res = _calculator.subtract(firstNum, secondNum).toString();
          break;
        case 'X':
          res = _calculator.multiply(firstNum, secondNum).toString();
          break;
        case '/':
          res = _calculator.divide(firstNum, secondNum).toString();
          break;
        case '%':
          res = _calculator.modulus(firstNum, secondNum).toString();
          break;
        case '^':
          res = _calculator.power(firstNum, secondNum).toString();
          break;
        default:
          res = "Error";
      }
      history = "$firstNum $operation $secondNum";
    } catch (e) {
      res = "Error: ${e.toString()}";
    }
    setState(() {
      textToDisplay = res;
    });
  }

  void btnOnClick(String btnval) {
    if (btnval == 'C') {
      firstNum = 0;
      secondNum = 0;
      history = "";
      textToDisplay = "0";
      operation = "";
      res = "";
    } else if (btnval == "AC") {
      firstNum = 0;
      secondNum = 0;
      history = "";
      textToDisplay = "";
      operation = "";
      res = "";
    } else if (btnval == "+/-") {
      if (textToDisplay != "0") {
        if (textToDisplay.contains("-")) {
          textToDisplay = textToDisplay.replaceRange(0, 1, "");
        } else {
          textToDisplay = "-$textToDisplay";
        }
      }
    } else if (btnval == "del") {
      if (textToDisplay.length > 1) {
        textToDisplay = textToDisplay.substring(0, textToDisplay.length - 1);
      } else {
        textToDisplay = "0";
      }
    } else if (['+', '-', 'X', '/', '%', '^'].contains(btnval)) {
      firstNum = double.tryParse(textToDisplay) ?? 0;
      operation = btnval;
      history = "$textToDisplay $operation"; 
      textToDisplay = ""; 
    } else if (btnval == "=") {
      secondNum = double.tryParse(textToDisplay) ?? 0;
      calculateResult();
    } else {
      if (textToDisplay == "0") {
        textToDisplay = btnval; // Start fresh if "0" is currently displayed
      } else {
        textToDisplay += btnval; // Append the number
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Advanced Calculator",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Advanced Calculator",
            style: GoogleFonts.rubik(
              textStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        backgroundColor: const Color(0xFF28527a),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: const Alignment(1.0, 1.0),
                padding: const EdgeInsets.all(12),
                child: Text(
                  history,
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      color: Color(0X66FFFFFF),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(1.0, 1.0),
                padding: const EdgeInsets.all(12),
                child: Text(
                  textToDisplay,
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ..._buildButtonRows(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildButtonRows() {
    const List<List<String>> buttonLabels = [
      ['AC', 'C', 'del', '/'],
      ['9', '8', '7', 'X'],
      ['6', '5', '4', '-'],
      ['3', '2', '1', '+'],
      ['+/-', '0', '%', '^', '='],
    ];
    return buttonLabels.map((row) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: row.map((label) {
          return Buttons(
            text: label,
            fillColor: (['+', '-', 'X', '/', '=', '%', '^'].contains(label))
                ? 0xFFf4d168
                : 0xFF8ac4d0,
            textColor: 0xFF000000,
            textSize: (label == '+/-' || label == '%') ? 10 : 16,
            callback: btnOnClick,
          );
        }).toList(),
      );
    }).toList();
  }
}
