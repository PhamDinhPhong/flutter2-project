import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final VoidCallback? onSkipPressed;

  MyAppBar({required this.titleText, this.onSkipPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      // Đặt màu nền là trong suốt
      elevation: 0,
      // Đặt độ nâng của shadow là 0 để không hiển thị shadow
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new_outlined),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(titleText),
      centerTitle: true,
      actions: <Widget>[
        TextButton(
          onPressed: onSkipPressed,
          child: const Text(
            'Skip',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
