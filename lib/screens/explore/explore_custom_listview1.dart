import 'package:flutter/material.dart';

class Card02 extends StatelessWidget {
  final String img;
  final String text;
  final String text1;

  final VoidCallback onPressed;
  const Card02(
      {super.key,
      required this.img,
      required this.text,
      required this.text1,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  img,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 190,
                    child: Text(
                      text,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    text1,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.5,
                      color: Color.fromARGB(255, 138, 148, 162),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
