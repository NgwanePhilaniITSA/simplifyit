import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'Components/Cards/BigCard.dart'; // Import BigCard component
import 'Components/Cards/CustomeCard.dart'; // Import other necessary components
import 'Controllers/HomeController.dart'; // Import HomeController

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _homeController;
  String time = "12:30 PM";
  String weather = "Sunny";
  String temperature = "25"; // Default data for testing

  @override
  void initState() {
    super.initState();
    _homeController = HomeController(context);
    _loadData(); // Load data as soon as the widget is initialized
  }

  // Function to load weather, temperature, and time data asynchronously
  Future<void> _loadData() async {
    try {
      // Fetch weather and temperature asynchronously
      String fetchedWeather = await _homeController.fetchWeather();
      String fetchedTemperature = await _homeController.fetchTemperature();

      setState(() {
        // Update weather and temperature values with real data from API
        weather = fetchedWeather;
        temperature = fetchedTemperature;

        // Update the time based on system time
        time =
            "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
      });
    } catch (e) {
      // Handle any errors that might occur when fetching the data
      print('Error loading data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Text(
                'SimplifyIT Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildDrawerItem(Icons.calendar_today, 'Calendar', () {}),
            _buildDrawerItem(Icons.access_time, 'My TimeSheet', () {}),
            _buildDrawerItem(Icons.beach_access, 'My Leaves', () {}),
            _buildDrawerItem(Icons.settings, 'Settings', () {}),
            _buildDrawerItem(Icons.logout, 'Logout', () {
              _homeController.showLogoutConfirmation(context);
            }),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeText(),
            const SizedBox(height: 30),
            // BigCard displaying real-time data
            BigCard(
              time: time,
              weather: weather,
              temperature: temperature,
            ),
            const SizedBox(height: 20),
            // Grid of CustomCards
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: <Widget>[
                  CustomCard(
                    icon: Icons.beach_access,
                    title: 'My Leaves',
                    description: 'View your leave balances',
                    onTap: () {},
                  ),
                  CustomCard(
                    icon: Icons.check_circle,
                    title: 'My Tasks',
                    description: 'View your tasks for the day',
                    onTap: () {},
                  ),
                  CustomCard(
                    icon: Icons.assignment,
                    title: 'My Assignments',
                    description: 'Check your assignments',
                    onTap: () {},
                  ),
                  CustomCard(
                    icon: Icons.work,
                    title: 'Work Overview',
                    description: 'Get an overview of your work',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build menu items in the drawer
  ListTile _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }

  // Helper function to build animated welcome text
  Widget _buildWelcomeText() {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(seconds: 1),
      child: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 20.0, end: 40.0),
          duration: const Duration(seconds: 2),
          builder: (context, value, child) {
            return Text(
              "Welcome to SimplifyIT!",
              style: TextStyle(
                fontSize: value,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(3.0, 3.0),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
