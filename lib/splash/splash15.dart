import 'package:flutter/material.dart';
import 'package:yoga_app/splash/splash16.dart';


class splash15 extends StatefulWidget {
  const splash15({super.key});

  @override
  State<splash15> createState() => _splash15State();
}

class _splash15State extends State<splash15> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => splash16()),
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
              "03",
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey,
              ),
            ),
            Text(
              "Body",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "data",
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
