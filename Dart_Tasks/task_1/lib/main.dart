import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/widgets/buttons.dart'; // Ensure this import is correct

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int firstNum = 0;
  int secondNum = 0;
  String history = "";
  String textToDisplay = "0";
  String operation = "";
  String res = "";

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
        textToDisplay = "-" + textToDisplay;
      }
    }
  } else if (btnval == "<") {
    if (textToDisplay.length > 1) {
      textToDisplay = textToDisplay.substring(0, textToDisplay.length - 1);
    } else {
      textToDisplay = "0";
    }
  } else if (btnval == "+" || btnval == "-" || btnval == "X" || btnval == "/") {
    firstNum = int.parse(textToDisplay);
    operation = btnval;
    textToDisplay = operation; // Clear the display for the second number input
  } else if (btnval == "=") {
    secondNum = int.parse(textToDisplay);
    if (operation == "+") {
      res = (firstNum + secondNum).toString();
      history = firstNum.toString() + operation + secondNum.toString();
    } else if (operation == "-") {
      res = (firstNum - secondNum).toString();
      history = firstNum.toString() + operation + secondNum.toString();
    } else if (operation == "X") {
      res = (firstNum * secondNum).toString();
      history = firstNum.toString() + operation + secondNum.toString();
    } else if (operation == "/") {
      if (secondNum != 0) {
        res = (firstNum / secondNum).toString();
        history = firstNum.toString() + operation + secondNum.toString();
      } else {
        res = "Error!";
        history = firstNum.toString() + operation + secondNum.toString();
      }
    }
    textToDisplay = res;
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
      title: "Simple Calculator",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Simple Calculator",
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
      ['AC', 'C', '<', '/'],
      ['9', '8', '7', 'X'],
      ['6', '5', '4', '-'],
      ['3', '2', '1', '+'],
      ['+/-', '0', '00', '='],
    ];
    return buttonLabels.map((row) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: row.map((label) {
          return Buttons(
            text: label,
            fillColor: (label == '+' ||
                    label == '-' ||
                    label == 'X' ||
                    label == '/' ||
                    label == '=')
                ? 0xFFf4d168
                : 0xFF8ac4d0,
            textColor: 0xFF000000,
            textSize: (label == '+/-' || label == '00') ? 16 : 20,
            callback: btnOnClick,
          );
        }).toList(),
      );
    }).toList();
  }
}
