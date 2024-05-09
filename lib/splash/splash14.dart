import 'package:flutter/material.dart';
import 'package:yoga_app/splash/splash15.dart';


class splash14 extends StatelessWidget {
  const splash14({super.key});

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
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => splash15()),
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
            Expanded(
                child: Column(
              children: [
                SizedBox(height: 50),
                Image.asset(
                  'assets/heart.jpg',
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 50),
                Text(
                  "We're to help people like you!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 14),
                  child: RichText(
                    textAlign: TextAlign.center,
                    // Căn lề giữa theo chiều ngang
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: '83%',
                          style: TextStyle(
                            color: Colors.pink,
                          ),
                        ),
                        TextSpan(
                          text:
                              ' of our users rated our customized yoga programs as easy to follow and have excellent results with practice.', // Phần còn lại của chuỗi
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
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
                            splash15()), // Thay NextPage bằng tên trang tiếp theo của bạn
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Màu nền của nút là đen
                  padding:
                      EdgeInsets.symmetric(vertical: 15), // Padding cho nút
                ),
                child: Text(
                  'Next',
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
