import 'package:flutter/material.dart';

class GoalOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final Function(bool) onSelected;

  const GoalOption({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double marginValue = screenWidth * 0.04;

    return GestureDetector(
      onTap: () {
        onSelected(
            !isSelected); // Gửi lại trạng thái của lựa chọn khi nó được nhấn
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.1,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? Colors.purple : Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: isSelected ? Colors.purple : Colors.grey),
                SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                Text(
                  title,
                  style: TextStyle(
                      color: isSelected ? Colors.purple : Colors.grey,
                      fontSize: 20),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: marginValue),
              child: isSelected
                  ? Icon(Icons.check_circle_rounded, color: Colors.purple)
                  : Icon(Icons.check_circle_rounded, color: Colors.grey),
            ),
            // Hiển thị biểu tượng đánh dấu nếu lựa chọn được chọn
          ],
        ),
      ),
    );
  }
}
