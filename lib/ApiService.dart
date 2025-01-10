import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String BASE_API_URL = "https://192.168.3.18:5001/api";
  static const String LOGIN = "$BASE_API_URL/v3/User/Login";

  // Method to handle user login
  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    // The request body
    final Map<String, String> requestBody = {
      'email': email,
      'password': password,
    };

    // Send POST request to the API
    try {
      final response = await http.post(
        Uri.parse(LOGIN),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the response
        return json.decode(response.body);
      } else if (response.statusCode == 400) {
        // Handle bad request error
        return {
          'success': false,
          'message': 'Bad Request. Please check your input.',
        };
      } else if (response.statusCode == 401) {
        // Handle unauthorized error (e.g. wrong credentials)
        return {
          'success': false,
          'message': 'Invalid email or password.',
        };
      } else {
        // Handle other non-200 responses
        return {
          'success': false,
          'message': 'Failed to login. Please try again.',
        };
      }
    } catch (e) {
      // If an error occurs, print the error and return a failure response
      print("Error: $e");
      return {
        'success': false,
        'message': 'An error occurred. Please check your internet connection.',
      };
    }
  }
}
