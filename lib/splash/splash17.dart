import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:yoga_app/models/MyAppBar.dart';
import 'package:yoga_app/splash/splash18.dart';


class splash17 extends StatefulWidget {
  const splash17({Key? key}) : super(key: key);

  @override
  State<splash17> createState() => _splash17WidgetState();
}

class _splash17WidgetState extends State<splash17> {
  RulerPickerController? _rulerPickerController;
  num currentValue = 152.4; // Giá trị mặc định là 152.4 cm
  List<RulerRange> ranges = const [
    RulerRange(begin: 0, end: 300, scale: 1), // Phạm vi từ 0 đến 300
  ];
  bool isFeetSelected = false; // Đơn vị hiện tại là cm

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: currentValue);
  }

  // Hàm chuyển đổi từ cm sang feet và ngược lại
  num convertHeight(num value, bool toFeet) {
    if (toFeet) {
      // Chuyển từ cm sang feet
      return value / 30.48; // 1 feet = 30.48 cm
    } else {
      // Chuyển từ feet sang cm
      return value * 30.48; // 1 cm = 0.0328084 feet
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        titleText: '03 BODY DATA',
        onSkipPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => splash18()),
          );
        },
      ),
      body: Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                "What's your height?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ToggleButtons(
                isSelected: [!isFeetSelected, isFeetSelected],
                onPressed: (index) {
                  setState(() {
                    isFeetSelected = index == 1;
                    currentValue = convertHeight(currentValue, isFeetSelected);
                  });
                },
                children: [
                  Text('cm',
                      style: TextStyle(
                          color: !isFeetSelected ? Colors.grey : Colors.black)),
                  Text('ft',
                      style: TextStyle(
                          color: isFeetSelected ? Colors.grey : Colors.black)),
                ],
                color: Colors.grey[300],
                selectedColor: Colors.black,
                fillColor: Colors.grey[300],
                borderColor: Colors.grey[300],
                selectedBorderColor: Colors.black,
                borderRadius: BorderRadius.circular(8.0),
              ),
              Expanded(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          currentValue.toStringAsFixed(1),
                          style: const TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.3),
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Image.asset(
                            'assets/height.png',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    RotatedBox(
                      quarterTurns: 1, // Không cần xoay RulerPicker
                      child: RulerPicker(
                        controller: _rulerPickerController!,
                        onBuildRulerScaleText: (index, value) {
                          return value.toInt().toString();
                        },
                        ranges: ranges,
                        scaleLineStyleList: const [
                          ScaleLineStyle(
                              color: Colors.grey,
                              width: 1.5,
                              height: 30,
                              scale: 0),
                          ScaleLineStyle(
                              color: Colors.grey,
                              width: 1,
                              height: 25,
                              scale: 5),
                          ScaleLineStyle(
                              color: Colors.grey,
                              width: 1,
                              height: 15,
                              scale: -1),
                        ],
                        onValueChanged: (value) {
                          setState(() {
                            currentValue = value;
                          });
                        },
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 80,
                        rulerMarginTop: 8,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.08,
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.05),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => splash18()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.black, // Màu chữ của nút là trắng
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                        color: Colors.white), // Màu chữ của nút là trắng
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
