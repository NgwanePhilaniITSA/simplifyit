import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart'; // Import weather_icons package

// BigCard component for displaying real-time data and weather
class BigCard extends StatelessWidget {
  final String time;
  final String weather;
  final String temperature;

  const BigCard({
    Key? key,
    required this.time,
    required this.weather,
    required this.temperature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Choose an icon based on the weather condition
    IconData weatherIcon;

    if (weather.toLowerCase() == 'sunny') {
      weatherIcon = WeatherIcons.day_sunny; // Sunny weather icon
    } else if (weather.toLowerCase() == 'cloudy') {
      weatherIcon = WeatherIcons.cloudy; // Cloudy weather icon
    } else if (weather.toLowerCase() == 'rainy') {
      weatherIcon = WeatherIcons.rain; // Rainy weather icon
    } else {
      weatherIcon =
          WeatherIcons.na; // Default icon if weather condition is unknown
    }

    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the time
            Text(
              time,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 10),
            // Display the weather icon and weather condition
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  weatherIcon,
                  size: 40,
                  color: Colors.deepPurple,
                ),
                SizedBox(width: 8),
                Text(
                  weather,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.deepPurple.shade700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Display the temperature
            Text(
              '$temperature°C',
              style: TextStyle(
                fontSize: 18,
                color: Colors.deepPurple.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
