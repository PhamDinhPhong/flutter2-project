import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

import 'package:flutter_svg/svg.dart';
import 'package:yoga_app/screens/report/report_ruler_picker.dart';

class ReportBMI extends StatefulWidget {
  const ReportBMI({Key? key}) : super(key: key);

  @override
  State<ReportBMI> createState() => _ReportBMIState();
}

class _ReportBMIState extends State<ReportBMI> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double? bmi;
  String status = '';

  void calculateBMI() {
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);
    setState(() {
      bmi = weight! / pow((height! / 100), 2);
      if (bmi! < 18.5) {
        status = "Underweight";
      } else if (bmi! > 18.5 && bmi! < 25) {
        status = 'Normal weight';
      } else if (bmi! > 25 && bmi! < 30) {
        status = 'Pre-Obesity';
      } else if (bmi! > 30 && bmi! < 35) {
        status = 'Obesity class 1';
      } else if (bmi! > 35 && bmi! < 40) {
        status = 'Obesity class 2';
      } else {
        status = 'Obesity class 3';
      }
    });
  }

  void showCalculateBMI() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            margin: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            height: 550,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "BMI",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Height",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  child: ReportRulerPicker(
                    text1: "cm",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Weight",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  child: ReportRulerPicker(
                    text1: "kg",
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Done",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'Underweight':
        return Colors.blue;
      case 'Normal weight':
        return Colors.green;
      case 'Pre-Obesity':
        return Colors.yellow.shade700;
      case 'Obesity class 1':
        return Colors.orange;
      case 'Obesity class 2':
        return Colors.deepOrangeAccent;
      case 'Obesity class 3':
        return Colors.red;
      default:
        return Colors
            .black; // Màu mặc định nếu không rơi vào các trạng thái trên
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TextField(
        //   controller: _heightController,
        //   keyboardType: TextInputType.number,
        //   textInputAction: TextInputAction.next,
        //   decoration: const InputDecoration(
        //       labelText: 'Height (cm)', suffixText: 'centimeters'),
        // ),
        // const SizedBox(
        //   height: 20,
        // ),
        // TextField(
        //   controller: _weightController,
        //   keyboardType: TextInputType.number,
        //   decoration: const InputDecoration(
        //     labelText: 'Weight (kg)',
        //     suffixText: 'kilograms',
        //   ),
        // ),
        // const SizedBox(
        //   height: 20,
        // ),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: [
        //     ElevatedButton(
        //       onPressed: calculateBMI,
        //       child: const Text('Calculate'),
        //     ),
        //   ],
        // ),
        // const SizedBox(
        //   height: 30,
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Text(
                    "BMI",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "(kg/m\u00B2)",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              InkWell(
                onTap: showCalculateBMI,
                child: Container(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 147, 179, 198),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/pencil.svg",
                        height: 14,
                        width: 14,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        "Edit",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    bmi == null ? '00.00' : bmi!.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 30,
                      color: getStatusColor(status),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        status,
                        style: TextStyle(
                          color: getStatusColor(status),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 25,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(15)),
                        color: Colors.blue,
                      ),
                      child: const Center(
                          child: Text('Underweight',
                              style:
                                  TextStyle(fontSize: 8, color: Colors.white))),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 25,
                      color: Colors.green,
                      child: const Center(
                          child: Text('Normal \nweight',
                              style:
                                  TextStyle(fontSize: 8, color: Colors.white))),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 25,
                      color: Colors.yellow.shade700,
                      child: const Center(
                          child: Text('Pre-Obesity',
                              style:
                                  TextStyle(fontSize: 8, color: Colors.white))),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 25,
                      color: Colors.orange,
                      child: const Center(
                          child: Text('Obesity \nclass 1',
                              style:
                                  TextStyle(fontSize: 8, color: Colors.white))),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 25,
                      color: Colors.deepOrangeAccent,
                      child: const Center(
                        child: Text(
                          'Obesity \nclass 2',
                          style: TextStyle(fontSize: 8, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 25,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.horizontal(right: Radius.circular(15)),
                        color: Colors.red,
                      ),
                      child: const Center(
                          child: Text('Obesity \nclass 3',
                              style:
                                  TextStyle(fontSize: 8, color: Colors.white))),
                    ),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('0'),
                  Text('18.5'),
                  Text('25.0'),
                  Text('30.0'),
                  Text('35.0'),
                  Text('40.0'),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
