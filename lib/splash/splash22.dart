import 'package:flutter/material.dart';
import 'package:yoga_app/models/MyAppBar.dart';
import 'package:yoga_app/splash/splash23.dart';


class splash22 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(
        titleText: '',
        onSkipPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => splash23()),
          );
        },
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/bg23.webp',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.6,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height *
                  0.35, // Điều chỉnh chiều cao của phần trắng
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  // Điều chỉnh bán kính cong của góc trên trái
                  topRight: Radius.circular(
                      30), // Điều chỉnh bán kính cong của góc trên phải
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Text(
                    "Attracttive Figure",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "10 Minutes a Day",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.06),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => splash23()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.black, // Màu chữ của nút là trắng
                      ),
                      child: Text(
                        'I Can Handle It!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ), // Màu chữ của nút là trắng
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Add other widgets here
        ],
      ),
    );
  }
}
