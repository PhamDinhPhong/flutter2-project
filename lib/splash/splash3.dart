import 'package:flutter/material.dart';
import 'package:yoga_app/splash/splash4.dart';


class splash3 extends StatefulWidget {
  const splash3({super.key});

  @override
  State<splash3> createState() => _splash3State();
}

class _splash3State extends State<splash3> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => splash4()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "01",
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey,
              ),
            ),
            Text(
              "Goal",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black45,
              ),
            )
          ],
        ),
      ),
    );
  }
}
