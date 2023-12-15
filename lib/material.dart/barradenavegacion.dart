import 'package:flutter/material.dart';

Widget barradenavegacion(
    BuildContext context, int selectedIndex, Function(int) onTap) {
  return BottomNavigationBar(
    backgroundColor: Theme.of(context).primaryColor,
    selectedFontSize: 10,
    unselectedFontSize: 10,
    selectedItemColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(
        label: "Home",
        icon: Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        label: "Search",
        icon: Icon(Icons.search),
      ),
      BottomNavigationBarItem(
        label: "Your library",
        icon: Icon(Icons.library_music),
      ),
    ],
    currentIndex: selectedIndex,
    onTap: onTap,
  );
}
