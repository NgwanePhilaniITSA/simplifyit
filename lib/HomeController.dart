import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'main.dart';

class HomeController {
  final BuildContext context;

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
        // Show Logout Success dialog before navigating
        _showLogoutSuccess(context);

        // Optionally perform logout logic (clear session, etc.)
        // Navigate to the landing page after showing the success dialog
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LandingPage()),
            (Route<dynamic> route) => false,
          );
        });
      },
      btnCancelOnPress: () {},
    ).show();
  }

  // Method to show Logout Success dialog
  void _showLogoutSuccess(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      title: 'Logout Success',
      desc: 'You have successfully logged out.',
      btnOkText: 'Okay',
      btnOkOnPress: () {
        // Optionally handle any further action after the success dialog
      },
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
    return Future.delayed(const Duration(seconds: 1), () => "Sunny");
  }

  // Method to fetch temperature asynchronously (e.g., could be an API call)
  Future<String> fetchTemperature() async {
    return Future.delayed(const Duration(seconds: 1), () => "28°C");
  }
}
