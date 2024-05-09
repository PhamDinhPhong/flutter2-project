import 'package:flutter/material.dart';
import 'package:yoga_app/splash/splash8.dart';


class splash7 extends StatefulWidget {
  const splash7({super.key});

  @override
  State<splash7> createState() => _splash7State();
}

class _splash7State extends State<splash7> {
  double _currentSliderValue = 20;
  double _minSliderValue = 15;
  double _maxSliderValue = 40;

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
        title: Text('01 GOAL'),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => splash8()),
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
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "What's your ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "current",
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: " body shape?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Column(
                children: [
                  Image.asset('assets/bodyshape.jpeg'),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Text(
                    '${_currentSliderValue.round()}%',
                    // Hiển thị giá trị của slider
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Your estimated body fat",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 18,
                      // Đặt chiều cao của track
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
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
                      divisions: 5,
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
                        '${_minSliderValue.round()}%',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '${_maxSliderValue.round()}%',
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
                            splash8()), // Thay NextPage bằng tên trang tiếp theo của bạn
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
