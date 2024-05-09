import 'package:flutter/material.dart';
import 'package:yoga_app/screens/me/me.dart';
import 'package:yoga_app/screens/training/training.dart';
import 'package:yoga_app/screens/report/report.dart';
import 'package:yoga_app/screens/explore/explore.dart';

class AppRoutes {
  static const String training = '/training';
  static const String explore = '/explore';
  static const String report = '/report';
  static const String me = '/me';

  static final Map<String, WidgetBuilder> routes = {
    training: (context) => const Training(),
    explore: (context) => const Explore(),
    report: (context) => const Report(),
    me: (context) => const Me(),
  };
}
