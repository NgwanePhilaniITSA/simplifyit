import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'Controllers/AccountController.dart';
import 'main.dart';

class HomeController {
  final BuildContext context;
  late final AccountController _accountController;

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
        _showLogoutSuccess(context);

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
        _accountController.clearUserSession(context);
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
