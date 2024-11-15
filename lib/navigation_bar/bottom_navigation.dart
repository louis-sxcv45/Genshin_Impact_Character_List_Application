import 'package:flutter/material.dart';
import 'package:genshin_character/model/data_character.dart';
import 'package:genshin_character/ui/home.dart';
import 'package:genshin_character/ui/search.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  List <Widget> _currentPage = [
    const HomePage(),
    SearchPage(characterList: characterList,)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPage[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home), 
            label: 'Home'
          ),
          NavigationDestination(
            icon: Icon(Icons.search), 
            label: 'Search'
          ),
        ],
      ),
    );
  }
}