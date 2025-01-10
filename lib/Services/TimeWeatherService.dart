import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import dotenv to load environment variables
import 'package:http/http.dart' as http;
import 'dart:convert';

class TimeWeatherService {
  // Load the API key from the .env file
  final String apiKey = dotenv.env['64652500fd191149459573a5caa14049'] ?? '';

  // Method to fetch current time asynchronously
  Future<String> fetchCurrentTime() async {
    final now = DateTime.now();
    final formattedTime = "${now.hour}:${now.minute}:${now.second}";
    return Future.delayed(const Duration(seconds: 1), () => formattedTime);
  }

  // Method to fetch weather data asynchronously (real-time via an API)
  Future<String> fetchWeather() async {
    if (apiKey.isEmpty) {
      throw Exception('API key is missing!');
    }
    final response = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=Durban'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['current']['condition']['text'];
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  // Method to fetch temperature asynchronously (real-time via an API)
  Future<String> fetchTemperature() async {
    if (apiKey.isEmpty) {
      throw Exception('API key is missing!');
    }
    final response = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=Durban'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return "${data['current']['temp_c']}°C"; // Example: "28°C"
    } else {
      throw Exception('Failed to load temperature data');
    }
  }
}
