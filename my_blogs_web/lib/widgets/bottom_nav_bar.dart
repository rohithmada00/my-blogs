import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Blog',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_mail),
          label: 'Contact',
        ),
      ],
      // currentIndex: _selectedIndex,
      // selectedItemColor: Colors.amber[800],
      // onTap: _onItemTapped,
    );
  }
}
