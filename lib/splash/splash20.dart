import 'package:flutter/material.dart';

import 'package:yoga_app/models/MyAppBar.dart';
import 'package:yoga_app/splash/splash21.dart';

class splash20 extends StatefulWidget {
  const splash20({super.key});

  @override
  State<splash20> createState() => _splash20State();
}

class _splash20State extends State<splash20> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        titleText: '03 BODY DATA',
        onSkipPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => splash21()),
          );
        },
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "How yoga can change your face",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Image.asset(
              'assets/changeface.jpg',
              width: 400,
              height: 400,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Text(
                  "Yoga can boost circulation, relieve facial muscle tension, and fight against aging. It's a natural face care to refine your complexion and fighten facial contrours.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                )),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.08,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => splash21()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.black, // Màu chữ của nút là trắng
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white), // Màu chữ của nút là trắng
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
