import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Custom01 extends StatelessWidget {
  final String text;
  final String text1;
  final String svgImg;
  final IconData? iconData;
  final bool useSwitch;

  final void Function(bool)? onSwitchChanged;

  const Custom01({
    super.key,
    required this.text,
    this.text1 = "",
    required this.svgImg,
    required this.useSwitch,
    this.iconData,
    this.onSwitchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    svgImg,
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: const TextStyle(fontSize: 17),
                      ),
                      Text(
                        text1,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 123, 123, 123),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  useSwitch
                      ? Transform.scale(
                          scale: 0.8,
                          child: Switch(
                            value: false,
                            onChanged: onSwitchChanged,
                          ),
                        )
                      : Icon(iconData ?? Icons.error),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
