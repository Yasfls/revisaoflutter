import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/habit_details_screen.dart';

class AppRoutes {
  static const home = '/';
  static const detalhes = '/detalhes';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomeScreen(),
    detalhes: (context) => HabitDetailsScreen(),
  };
}