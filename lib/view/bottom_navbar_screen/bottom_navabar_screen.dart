import 'package:flutter/material.dart';
import 'package:main_project_ui/view/Home_page/home_page.dart';
import 'package:main_project_ui/view/explore_screen/explore_screen.dart';
import 'package:main_project_ui/view/meditation_screen/meditation_screen.dart';
// import 'package:main_project_ui/view/mood_tracker_screen/mood_tracker_screen.dart';
import 'package:main_project_ui/view/profile_screen/profile_screen.dart';

class BottomNavbarScreen extends StatefulWidget {
  @override
  _BottomNavbarScreenState createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    ExploreScreen(), 
    MeditationScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal.shade300,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.self_improvement),
            label: 'Meditation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
