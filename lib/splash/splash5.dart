import 'package:flutter/material.dart';
import 'package:yoga_app/models/GenderOption.dart';
import 'package:yoga_app/splash/splash6.dart';


class splash5 extends StatefulWidget {
  const splash5({Key? key}) : super(key: key);

  @override
  State<splash5> createState() => _splash5State();
}

class _splash5State extends State<splash5> {
  String selectedGender = '';

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
                MaterialPageRoute(builder: (context) => splash6()),
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
            Text(
              "What's your gender?",
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: Colors.grey[200], // Màu xám nhạt
                borderRadius:
                    BorderRadius.circular(10), // Bo góc với bán kính 10
              ),
              child: Row(
                children: [
                  SizedBox(width: 5),
                  Icon(Icons.lightbulb),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      "We will calculate your basal metabolic rate and adjust your plan based on your gender.",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
            Expanded(
              child: Row(
                children: [
                  GenderOption(
                    title: 'Male',
                    imagePath: 'assets/male.png',
                    isSelected: selectedGender == 'Male',
                    onSelected: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          selectedGender = 'Male';
                        } else {
                          selectedGender = '';
                        }
                      });
                    },
                  ),
                  GenderOption(
                    title: 'Female',
                    imagePath: 'assets/female.png',
                    isSelected: selectedGender == 'Female',
                    onSelected: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          selectedGender = 'Female';
                        } else {
                          selectedGender = '';
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              // Chiều rộng của container là không giới hạn
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width -
                      50, // Chiều rộng của nút
                  height: 50,
                  child: ElevatedButton(
                    onPressed: selectedGender.isNotEmpty
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      splash6()), // Điều hướng đến splash5
                            );
                          }
                        : null,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                        (states) {
                          if (states!.contains(MaterialState.disabled)) {
                            return Colors
                                .grey; // Màu nền xám khi nút bị vô hiệu hóa
                          }
                          return Colors
                              .black; // Màu nền đen khi nút được kích hoạt
                        },
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Next',
                          style: TextStyle(
                            color: selectedGender.isNotEmpty
                                ? Colors.white
                                : Colors.white70, // Màu chữ trắng hoặc xám
                          ),
                        ),
                      ],
                    ),
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
