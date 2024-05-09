import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Titlee extends StatelessWidget {
  final String text;
  final String textButton;

  final VoidCallback onPressed;
  const Titlee(
      {super.key,
      required this.text,
      required this.onPressed,
      this.textButton = "View all >"});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          InkWell(
            onTap: onPressed,
            child: Text(
              textButton,
              style: const TextStyle(
                fontSize: 13,
                color: Color.fromARGB(255, 138, 148, 162),
              ),
            ),
          )
        ],
      )
    ]);
  }
}
