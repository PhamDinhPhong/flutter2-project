import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Card01 extends StatelessWidget {
  final String text1;
  final String text2;
  final String img;
  final double widthImgSize;
  final double heightImgSize;
  final VoidCallback onPressed;
  const Card01(
      {super.key,
      required this.text1,
      required this.text2,
      required this.img,
      required this.onPressed,
      required this.widthImgSize,
      required this.heightImgSize});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              img,
              width: widthImgSize,
              height: heightImgSize,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text1,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.5,
            ),
          ),
          Text(
            text2,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.5,
              color: Color.fromARGB(255, 138, 148, 162),
            ),
          ),
        ],
      ),
    );
  }
}
