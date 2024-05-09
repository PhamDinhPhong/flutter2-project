import 'package:flutter/material.dart';
import 'package:yoga_app/models/age.dart';
import 'package:yoga_app/splash/splash17.dart';


class splash16 extends StatefulWidget {
  const splash16({Key? key}) : super(key: key);

  @override
  _splash16State createState() => _splash16State();
}

class _splash16State extends State<splash16> {
  late FixedExtentScrollController _controller;
  late int _currentValue;

  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController(initialItem: 1);
    _currentValue = _controller.initialItem;
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
        title: Text('03 BODY DATA'),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => splash17()),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.purple, // Màu của đường viền
                      width: 2, // Độ dày của đường viền
                    ),
                  ),
                  child: Container(
                    // Container con để tạo lớp vùng trắng bên trong
                    decoration: BoxDecoration(
                      color: Colors.white, // Màu của bộ khung bên trong
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification notification) {
                    if (notification is ScrollEndNotification) {
                      // Đã có itemExtent nên không cần sử dụng metrics.itemExtent
                      final int indexOfMiddleElement = _controller.selectedItem;
                      setState(() {
                        _currentValue = indexOfMiddleElement;
                      });
                    }
                    return true;
                  },
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    perspective: 0.005,
                    diameterRatio: 1.0,
                    physics: FixedExtentScrollPhysics(),
                    controller: _controller,
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 100,
                      builder: (context, index) {
                        final textColor = (_currentValue == index)
                            ? Colors.purple
                            : Colors.grey;
                        return MyAge(
                          age: index,
                          textColor: textColor,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.04),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => splash17()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.black, // Màu chữ của nút là trắng
                minimumSize: Size(
                    MediaQuery.of(context).size.width * 0.8,
                    MediaQuery.of(context).size.height *
                        0.08), // Kích thước tối thiểu của nút
              ),
              child: Text(
                'Next',
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
