import 'package:flutter/material.dart';
import 'package:yoga_app/models/FocusAreaOption.dart';
import 'package:yoga_app/splash/splash7.dart';


class splash6 extends StatefulWidget {
  const splash6({Key? key}) : super(key: key);

  @override
  State<splash6> createState() => _splash6State();
}

class _splash6State extends State<splash6> {
  String selectedGender = '';
  List<String> selectedAreas = [];
  bool isFullBodySelected = false;

  @override
  Widget build(BuildContext context) {
    bool isAnyOptionSelected =
        selectedGender.isNotEmpty || selectedAreas.isNotEmpty;

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
                MaterialPageRoute(builder: (context) => splash7()),
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
            Text(
              "What's your focus area?",
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            SizedBox(height: 50),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FocusAreaOption(
                        label: 'Full Body',
                        isSelected: isFullBodySelected,
                        onTap: () {
                          setState(() {
                            if (!isFullBodySelected) {
                              isFullBodySelected = true;
                              selectedAreas = ['Arm', 'Chest', 'Belly', 'Leg'];
                            } else {
                              isFullBodySelected = false;
                              selectedAreas.clear();
                            }
                          });
                        },
                        isFullBody: isFullBodySelected,
                      ),
                      FocusAreaOption(
                        label: 'Arm',
                        isSelected: selectedAreas.contains('Arm'),
                        onTap: () {
                          setState(() {
                            if (!selectedAreas.contains('Arm')) {
                              selectedAreas.add('Arm');
                            } else {
                              selectedAreas.remove('Arm');
                            }
                            // Nếu đã chọn Full Body và tắt một trong bốn phần còn lại, hủy chọn Full Body
                            if (selectedAreas.length < 4 &&
                                isFullBodySelected) {
                              isFullBodySelected = false;
                            }
                            // Nếu đã chọn cả 4 phần còn lại ngoại trừ Full Body, tự động chọn cả Full Body
                            if (selectedAreas.length == 4 &&
                                !isFullBodySelected) {
                              isFullBodySelected = true;
                            }
                          });
                        },
                        isFullBody: isFullBodySelected,
                      ),
                      FocusAreaOption(
                        label: 'Chest',
                        isSelected: selectedAreas.contains('Chest'),
                        onTap: () {
                          setState(() {
                            if (!selectedAreas.contains('Chest')) {
                              selectedAreas.add('Chest');
                            } else {
                              selectedAreas.remove('Chest');
                            }
                            if (selectedAreas.length < 4 &&
                                isFullBodySelected) {
                              isFullBodySelected = false;
                            }
                            if (selectedAreas.length == 4 &&
                                !isFullBodySelected) {
                              isFullBodySelected = true;
                            }
                          });
                        },
                        isFullBody: isFullBodySelected,
                      ),
                      FocusAreaOption(
                        label: 'Belly',
                        isSelected: selectedAreas.contains('Belly'),
                        onTap: () {
                          setState(() {
                            if (!selectedAreas.contains('Belly')) {
                              selectedAreas.add('Belly');
                            } else {
                              selectedAreas.remove('Belly');
                            }
                            if (selectedAreas.length < 4 &&
                                isFullBodySelected) {
                              isFullBodySelected = false;
                            }
                            if (selectedAreas.length == 4 &&
                                !isFullBodySelected) {
                              isFullBodySelected = true;
                            }
                          });
                        },
                        isFullBody: isFullBodySelected,
                      ),
                      FocusAreaOption(
                        label: 'Leg',
                        isSelected: selectedAreas.contains('Leg'),
                        onTap: () {
                          setState(() {
                            if (!selectedAreas.contains('Leg')) {
                              selectedAreas.add('Leg');
                            } else {
                              selectedAreas.remove('Leg');
                            }
                            if (selectedAreas.length < 4 &&
                                isFullBodySelected) {
                              isFullBodySelected = false;
                            }
                            if (selectedAreas.length == 4 &&
                                !isFullBodySelected) {
                              isFullBodySelected = true;
                            }
                          });
                        },
                        isFullBody: isFullBodySelected,
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/man.png',
                    fit: BoxFit.contain,
                    width: 350,
                    height: MediaQuery.of(context).size.height * 0.49,
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 30),
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isAnyOptionSelected
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      splash7()), // Điều hướng đến splash6
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
                            color: isAnyOptionSelected
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
