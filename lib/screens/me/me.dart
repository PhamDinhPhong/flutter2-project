import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoga_app/screens/me/me_custom1.dart';

class Me extends StatelessWidget {
  const Me({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(71, 219, 211, 211),
      appBar: AppBar(
        title: const Text(
          'Me',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                        child: SizedBox(
                          width: double.infinity,
                          height: 65,
                          child: InkWell(
                            onTap: () {
                              print("Ok");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          "Backup & Restore",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        const SizedBox(width: 12),
                                        Image.asset(
                                          "assets/images/google.webp",
                                          width: 20,
                                          height: 20,
                                        )
                                      ],
                                    ),
                                    const Text(
                                      "Sign in and synchronize your data",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(
                                              255, 140, 140, 140)),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 62),
                                const Icon(
                                  Icons.loop,
                                  size: 24,
                                  color: Color.fromARGB(255, 147, 176, 193),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 340,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 248, 244, 145),
                              Color.fromARGB(255, 230, 215, 244),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            foregroundColor: Colors.white),
                        onPressed: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/diamond.svg",
                                  width: 30,
                                  height: 30,
                                ),
                                const Text(
                                  "Go Premium",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.italic),
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_right_outlined,
                                  color: Colors.black,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "WORKOUT",
                  style: TextStyle(
                      fontSize: 18,
                      letterSpacing: -0.9,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Custom01(
                          text: "My Profile",
                          useSwitch: false,
                          svgImg: "assets/icons/profile.svg",
                          iconData: Icons.keyboard_arrow_right_outlined,
                        ),
                      ),
                      SizedBox(height: 13),
                      Custom01(
                        text: "Reminder",
                        svgImg: "assets/icons/bell.svg",
                        useSwitch: false,
                        iconData: Icons.keyboard_arrow_right_outlined,
                      ),
                      SizedBox(height: 13),
                      Custom01(
                        text: "Sound options",
                        svgImg: "assets/icons/sound.svg",
                        useSwitch: false,
                        iconData: Icons.keyboard_arrow_right_outlined,
                      ),
                      SizedBox(height: 13),
                      Custom01(
                        text: "Coach voice",
                        text1: "Device TTS Engine",
                        svgImg: "assets/icons/voice.svg",
                        useSwitch: false,
                        iconData: Icons.keyboard_arrow_right_outlined,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "GENERAL SETTINGS",
                  style: TextStyle(
                      fontSize: 18,
                      letterSpacing: -0.9,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 260,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Custom01(
                          text: "Sync to Google Fit",
                          svgImg: "assets/icons/google_fit.svg",
                          useSwitch: true,
                          onSwitchChanged: (bool newValue) {},
                        ),
                      ),
                      const SizedBox(height: 13),
                      Custom01(
                        text: "Turn on water tracker",
                        svgImg: "assets/icons/glass_water.svg",
                        useSwitch: true,
                        onSwitchChanged: (bool newValue) {},
                      ),
                      const SizedBox(height: 13),
                      const Custom01(
                        text: "Language options",
                        text1: "English",
                        svgImg: "assets/icons/translate.svg",
                        useSwitch: false,
                        iconData: Icons.keyboard_arrow_right_outlined,
                      ),
                      const SizedBox(height: 13),
                      const Custom01(
                        text: "Restart",
                        svgImg: "assets/icons/restart.svg",
                        useSwitch: false,
                        iconData: Icons.keyboard_arrow_right_outlined,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "SUPPORT US",
                  style: TextStyle(
                      fontSize: 18,
                      letterSpacing: -0.9,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Custom01(
                          text: "Share with friends",
                          useSwitch: false,
                          svgImg: "assets/icons/share.svg",
                          iconData: Icons.keyboard_arrow_right_outlined,
                        ),
                      ),
                      SizedBox(height: 13),
                      Custom01(
                        text: "Rate us",
                        svgImg: "assets/icons/rate_us.svg",
                        useSwitch: false,
                        iconData: Icons.keyboard_arrow_right_outlined,
                      ),
                      SizedBox(height: 13),
                      Custom01(
                        text: "Feedback",
                        svgImg: "assets/icons/gmail.svg",
                        useSwitch: false,
                        iconData: Icons.keyboard_arrow_right_outlined,
                      ),
                      SizedBox(height: 13),
                      Custom01(
                        text: "Privacy policy",
                        svgImg: "assets/icons/policy.svg",
                        useSwitch: false,
                        iconData: Icons.keyboard_arrow_right_outlined,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
