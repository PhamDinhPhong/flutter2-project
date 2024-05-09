import 'package:flutter/material.dart';
import 'package:yoga_app/splash/splash10.dart';

class splash9 extends StatefulWidget {
  const splash9({super.key});

  @override
  State<splash9> createState() => _splash9State();
}

class _splash9State extends State<splash9> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => splash10()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "02",
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey,
              ),
            ),
            Text(
              "Fitness",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "analysis",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
