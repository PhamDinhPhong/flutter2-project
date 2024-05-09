import 'package:flutter/material.dart';

class MyAge extends StatelessWidget {
  int age;
  final Color textColor;

  MyAge({required this.age, required this.textColor});
  // MyAge({required this.age});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          age < 10 ? '0' + age.toString() : age.toString(),
          style: TextStyle(
            fontSize: 40,
            color: textColor,
            fontWeight: FontWeight.bold
          )
        ),
      ),
    );
  }
}
