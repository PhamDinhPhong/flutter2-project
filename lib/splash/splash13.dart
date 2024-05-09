import 'package:flutter/material.dart';
import 'package:yoga_app/splash/splash14.dart';


class splash13 extends StatefulWidget {
  const splash13({super.key});

  @override
  State<splash13> createState() => _splash13State();
}

class _splash13State extends State<splash13> {
  double _currentSliderValue = 1;
  double _minSliderValue = 1;
  double _maxSliderValue = 3;

  String getLabelText(double sliderValue) {
    if (sliderValue == 1) {
      return 'Less than 20';
    } else if (sliderValue == 2) {
      return '30';
    } else if (sliderValue == 3) {
      return 'More than 40';
    } else {
      return ''; // Trường hợp còn lại, có thể xử lý theo ý muốn của bạn
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          '02 FITNESS ANALYSIS',
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => splash14()),
              );
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "How many squats can you do at one time?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Image.asset(
                'assets/squats.jpg',
                width: 400,
                height: 400,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Squats', // Hiển thị giá trị của slider
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    getLabelText(_currentSliderValue),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 10,
                      // Đặt chiều cao của track
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                      // Đặt hình dạng của overlay
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      // Đặt hình dạng của thumb
                      thumbColor: Colors.purple,
                      // Đặt màu sắc của thumb
                      activeTrackColor: Colors.purple[100],
                      // Đặt màu sắc của phần track
                      inactiveTrackColor: Colors.purple[
                          100], // Đặt màu sắc của phần track không hoạt động
                    ),
                    child: Slider(
                      value: _currentSliderValue,
                      min: _minSliderValue,
                      max: _maxSliderValue,
                      divisions: 2,
                      label: _currentSliderValue.round().toString() + '%',
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '<20',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '>20',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              width: MediaQuery.of(context).size.width - 40,
              child: ElevatedButton(
                onPressed: () {
                  // Chuyển đến trang tiếp theo khi nút được nhấn
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            splash14()), // Thay NextPage bằng tên trang tiếp theo của bạn
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Màu nền của nút là đen
                  padding:
                      EdgeInsets.symmetric(vertical: 15), // Padding cho nút
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white, // Màu chữ là trắng
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
