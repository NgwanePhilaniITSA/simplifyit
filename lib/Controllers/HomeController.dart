import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../main.dart';

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

  // Method to fetch weather data asynchronously (real-time via an API)
  Future<String> fetchWeather() async {
    final response = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/current.json?key=64652500fd191149459573a5caa14049&q=Durban'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['current']['condition']['text']; // Example: "Sunny"
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  // Method to fetch temperature asynchronously (real-time via an API)
  Future<String> fetchTemperature() async {
    final response = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/current.json?key=64652500fd191149459573a5caa14049&q=Durban'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return "${data['current']['temp_c']}°C"; // Example: "28°C"
    } else {
      throw Exception('Failed to load temperature data');
    }
  }
}
