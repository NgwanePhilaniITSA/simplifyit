import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AnimatedCalendar extends StatefulWidget {
  const AnimatedCalendar({Key? key}) : super(key: key);

  @override
  _AnimatedCalendarState createState() => _AnimatedCalendarState();
}

class _AnimatedCalendarState extends State<AnimatedCalendar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late DateTime _selectedDate;
  late DateTime _currentMonth;

  // List of public holidays in South Africa (You can add more here)
  final List<Map<String, dynamic>> _southAfricanHolidays = [
    {'name': "New Year's Day", 'date': DateTime(2025, 1, 1)},
    {'name': "Human Rights Day", 'date': DateTime(2025, 3, 21)},
    {'name': "Freedom Day", 'date': DateTime(2025, 4, 27)},
    {'name': "Workers' Day", 'date': DateTime(2025, 5, 1)},
    {'name': "Youth Day", 'date': DateTime(2025, 6, 16)},
    {'name': "Women's Day", 'date': DateTime(2025, 8, 9)},
    {'name': "Day of Reconciliation", 'date': DateTime(2025, 12, 16)},
    {'name': "Christmas Day", 'date': DateTime(2025, 12, 25)},
    {'name': "Boxing Day", 'date': DateTime(2025, 12, 26)},
  ];

  @override
  void initState() {
    super.initState();

    // Initialize current date and selected date
    _selectedDate = DateTime.now();
    _currentMonth = DateTime(_selectedDate.year, _selectedDate.month);

    // Set up the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Define the opacity animation
    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    // Trigger the animation to start
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Helper method to generate a list of weeks for the current month
  List<List<DateTime>> _generateCalendar(DateTime month) {
    List<List<DateTime>> weeks = [];
    DateTime firstDayOfMonth = DateTime(month.year, month.month, 1);
    int firstWeekday =
        firstDayOfMonth.weekday; // Weekday of the 1st of the month
    int totalDaysInMonth = DateTime(month.year, month.month + 1, 0).day;

    // Generate the days for the calendar
    List<DateTime> days = [];
    for (int i = 1; i <= totalDaysInMonth; i++) {
      days.add(DateTime(month.year, month.month, i));
    }

    // Split the list of days into weeks
    while (days.isNotEmpty) {
      weeks.add(days.take(7).toList());
      days = days.skip(7).toList();
    }
    return weeks;
  }

  // Method to build the calendar UI
  Widget _buildCalendar(DateTime month) {
    List<List<DateTime>> weeks = _generateCalendar(month);

    return Column(
      children: [
        // Month and Year Display
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Previous Month Button
              IconButton(
                icon: const Icon(Icons.arrow_left),
                onPressed: () {
                  setState(() {
                    _currentMonth =
                        DateTime(_currentMonth.year, _currentMonth.month - 1);
                  });
                },
              ),
              // Month and Year Text
              Text(
                DateFormat('MMMM yyyy').format(month),
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              // Next Month Button
              IconButton(
                icon: const Icon(Icons.arrow_right),
                onPressed: () {
                  setState(() {
                    _currentMonth =
                        DateTime(_currentMonth.year, _currentMonth.month + 1);
                  });
                },
              ),
            ],
          ),
        ),
        // Days of the week header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text("Mon", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Tue", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Wed", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Thu", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Fri", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Sat", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Sun", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        // Calendar weeks
        Column(
          children: weeks.map((week) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: week.map((date) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Container(
                        margin: const EdgeInsets.all(4),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: _selectedDate.day == date.day
                              ? Colors.deepPurple
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: _selectedDate.day == date.day
                                ? Colors.white
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(
                              color: _selectedDate.day == date.day
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
            );
          }).toList(),
        ),
        // Display Holidays below the calendar
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: _southAfricanHolidays
                .map((holiday) => ListTile(
                      title: Text(holiday['name']),
                      subtitle: Text(
                          DateFormat('dd MMMM yyyy').format(holiday['date'])),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Calendar"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        // Wrap the entire body content in a scroll view
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return FadeTransition(
              opacity: _opacityAnimation,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildCalendar(_currentMonth),
              ),
            );
          },
        ),
      ),
    );
  }
}
