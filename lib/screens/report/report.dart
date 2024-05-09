import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:yoga_app/screens/report/bmi.dart';
import 'package:yoga_app/screens/report/calender.dart';
import 'package:yoga_app/screens/report/report_chart.dart';
import 'package:yoga_app/screens/report/report_ruler_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final DateFormat dayOfWeekFormatter = DateFormat('EEE');
  // Lấy số ngày
  final DateFormat dayOfMonthFormatter = DateFormat('d');
  DateTime now = DateTime.now();
  List<DateTime> getWeekDates(DateTime date) {
    final DateTime firstDayOfWeek =
        date.subtract(Duration(days: date.weekday - 1));
    return List.generate(
        7, (index) => firstDayOfWeek.add(Duration(days: index)));
  }

  // Show bottom Shet
  void _showEditModalBottomSheet() {
    final List<DateTime> weekDates = getWeekDates(now);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: 550,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Spacer(),
                  const Text(
                    "Weight",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.cancel,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "Date",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: weekDates.map(
                        (date) {
                          bool isToday = now.day == date.day;
                          return Container(
                            padding: const EdgeInsets.all(6),
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                Container(
                                  height: 45,
                                  width: 100,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: isToday ? Colors.transparent : null,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(
                                          255, 214, 154, 154),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        dayOfWeekFormatter.format(
                                          date,
                                        ),
                                        style: TextStyle(
                                            color: isToday
                                                ? const Color.fromARGB(
                                                    255, 56, 157, 228)
                                                : Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 17),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        dayOfMonthFormatter.format(date),
                                        style: TextStyle(
                                            color: isToday
                                                ? const Color.fromARGB(
                                                    255, 56, 157, 228)
                                                : Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 17),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "Weight",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                height: 250,
                child: ReportRulerPicker(
                  text1: "kg",
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Lấy viết tắt ngày trong tuần
    final List<DateTime> weekDates = getWeekDates(now);

    return Scaffold(
      backgroundColor: const Color.fromARGB(71, 219, 211, 211),
      appBar: AppBar(
        title: const Text(
          'Reports',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 230, 215, 244),
                Color.fromARGB(255, 248, 244, 145),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      child: Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/meditationIcon.svg",
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 7),
                            const Text(
                              "0",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            const Text(
                              "CLASS",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 190, 190, 190),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/fireIcon.svg",
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 7),
                            const Text(
                              "0.0",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            const Text(
                              "KCAL",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 190, 190, 190),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/clockIcon.svg",
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 7),
                            const Text(
                              "00:00",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            const Text(
                              "DURATION",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 190, 190, 190),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => FullCalendarPage(
                                  selectedDate: DateTime.now()),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "History",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: weekDates.map(
                        (date) {
                          bool isToday = now.day == date.day;
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) =>
                                      FullCalendarPage(selectedDate: date),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              child: Column(
                                children: [
                                  Text(
                                    dayOfWeekFormatter
                                        .format(date)
                                        .substring(0, 1),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color:
                                          isToday ? Colors.transparent : null,
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        width: 1,
                                        color: const Color.fromARGB(
                                            255, 214, 154, 154),
                                      ),
                                    ),
                                    child: Text(
                                      dayOfMonthFormatter.format(date),
                                      style: TextStyle(
                                          color: isToday
                                              ? const Color.fromARGB(
                                                  255, 56, 157, 228)
                                              : Colors.black,
                                          fontWeight: FontWeight.w700),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 450,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Text(
                                "Weight",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "(kg)",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: _showEditModalBottomSheet,
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
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "76.1",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Current",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "76.1",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Heaviest",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "76.1",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Lighttest",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                    ReportChart(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 220,
                padding: EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    const ReportBMI(),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text(
                          "BMI range and categories come from ",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final url = Uri.parse(
                                'https://en.wikipedia.org/wiki/Body_mass_index');
                            if (!await launchUrl(url)) {
                              throw 'Không thể khởi chạy $url';
                            }
                          },
                          child: const Text(
                            'Wiki',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
