import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function(String)? callback;

  const Buttons({
    super.key,
    required this.text,
    required this.fillColor,
    required this.textColor,
    required this.textSize,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 70,
        height: 70,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(fillColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          onPressed: () {
            if (callback != null) {
              callback!(text); // Pass the button text back to the callback
            }
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: textSize,
              color: Color(textColor),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
