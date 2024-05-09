import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Card03 extends StatelessWidget {
  final String img;
  final String text1;
  final String text2;
  final String? text3;
  final int setWidth;
  final int setHeight;
  final VoidCallback onTap;
  const Card03(
      {super.key,
      required this.img,
      required this.text1,
      required this.text2,
      this.text3,
      required this.onTap,
      this.setHeight = 180,
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
                Image.asset(
                  img,
                  width: 180,
                  height: 180,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 130,
                  right: 10,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.play_arrow_sharp),
                  ),
                ),
                if (text3 != null)
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        text3!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 180,
                  child: Text(
                    text1,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                    softWrap: true,
                  ),
                ),
                Text(
                  text2,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 38, 12, 123),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
