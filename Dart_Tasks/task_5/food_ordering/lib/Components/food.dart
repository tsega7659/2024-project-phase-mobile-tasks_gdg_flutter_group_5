import 'package:flutter/material.dart';
import 'dart:async';
import 'detail.dart'; // Import your DetailPage file

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  void initState() {
    super.initState();
    // Delay for 4 seconds and then navigate to DetailPage
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Detail()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 200),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: AssetImage("assets/images/panda.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 100),
              Text(
                "Enjoy Your Food",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
