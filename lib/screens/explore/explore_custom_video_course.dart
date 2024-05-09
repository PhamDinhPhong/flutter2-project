import 'package:flutter/material.dart';

class Card04 extends StatelessWidget {
  final String img;
  final String text1;
  final String text2;
  final double setWidth;
  final double setHeight;
  final VoidCallback onTap;
  const Card04(
      {super.key,
      required this.img,
      required this.text1,
      required this.text2,
      required this.onTap,
      this.setHeight = 280,
      this.setWidth = 180});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.9,
                  child: Image.asset(
                    img,
                    width: setHeight,
                    height: setWidth,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 67, 65, 65),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 30,
                  child: Text(
                    text1,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 17, 0),
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Positioned(
                  top: 140,
                  left: 30,
                  child: Text(
                    text2,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 225, 4, 4),
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
