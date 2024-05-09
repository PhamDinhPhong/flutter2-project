import 'package:flutter/material.dart';

class FocusAreaOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isFullBody;

  const FocusAreaOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.isFullBody,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 10, top: 5),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected || (isFullBody && label != 'Full Body')
                  ? Colors.purple
                  : Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18,
                color: isSelected || (isFullBody && label != 'Full Body')
                    ? Colors.purple
                    : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
