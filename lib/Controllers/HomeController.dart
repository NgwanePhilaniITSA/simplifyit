import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:simplifyit/Login.dart';

import '../main.dart';

class HomeController {
  final BuildContext context;

  // Constructor
  HomeController(this.context);

  // Method to show logout confirmation
  void showLogoutConfirmation(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.topSlide,
      title: 'Logout',
      desc: 'Are you sure you want to log out?',
      btnOkText: 'Yes',
      btnCancelText: 'No',
      btnOkOnPress: () {
        // Perform logout action here
        // You can add actual logout logic (e.g., clearing session or navigating to login page)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LandingPage()),
        );
      },
      btnCancelOnPress: () {},
    ).show();
  }

  // Method to fetch current time asynchronously
  Future<String> fetchCurrentTime() async {
    final now = DateTime.now();
    final formattedTime = "${now.hour}:${now.minute}:${now.second}";
    return Future.delayed(const Duration(seconds: 1), () => formattedTime);
  }

  // Method to fetch weather data asynchronously (e.g., could be an API call)
  Future<String> fetchWeather() async {
    // Placeholder weather data; replace with an actual API call if necessary
    return Future.delayed(const Duration(seconds: 1), () => "Sunny");
  }

  // Method to fetch temperature asynchronously (e.g., could be an API call)
  Future<String> fetchTemperature() async {
    // Placeholder temperature; replace with an actual API call if necessary
    return Future.delayed(const Duration(seconds: 1), () => "28°C");
  }
}
