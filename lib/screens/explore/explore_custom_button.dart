import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  final double textSize;
  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.buttonColor = const Color.fromARGB(255, 253, 239, 239),
      this.textColor = const Color.fromARGB(255, 51, 51, 51),
      this.textSize = 13});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
            color: textColor, fontSize: textSize, fontWeight: FontWeight.w500),
      ),
    );
  }
}
