import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:yoga_app/models/MyAppBar.dart';
import 'package:yoga_app/models/Splash21_Items.dart';
import 'package:yoga_app/splash/splash22.dart';

class splash21 extends StatefulWidget {
  const splash21({Key? key});

  @override
  State<splash21> createState() => _splash21State();
}

class _splash21State extends State<splash21> {
  final controller = Splash21Items();
  final pageController = PageController(viewportFraction: 0.6);

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      final double currentPage = pageController.page!;
      final double pageCount = controller.items.length.toDouble();

      // Nếu người dùng cuộn tới trang cuối và tiếp tục cuộn tiếp
      if (currentPage >= pageCount) {
        pageController.jumpToPage(0); // Quay lại trang đầu tiên
      } else if (currentPage <= 0) {
        // Nếu người dùng cuộn tới trang đầu tiên và tiếp tục cuộn tiếp
        pageController
            .jumpToPage(pageCount.toInt() - 1); // Quay lại trang cuối cùng
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        titleText: '03 BODY DATA',
        onSkipPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => splash22()),
          );
        },
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text(
              "Join our 200,000+ successful yogis!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: MediaQuery.of(context).size.height * 0.57,
              child: PageView.builder(
                controller: pageController,
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  final itemIndex = index % controller.items.length;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.35,
                          child: Image.asset(
                            controller.items[itemIndex].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          controller.items[itemIndex].title,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          controller.items[itemIndex].descriptions,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            SmoothPageIndicator(
              controller: pageController,
              count: controller.items.length,
              onDotClicked: (index) => pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeIn),
              effect: const WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                activeDotColor: Color(0xFF7357a4),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.06),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.08,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => splash22()),
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
      ),
    );
  }
}
