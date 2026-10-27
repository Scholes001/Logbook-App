import 'package:flutter/material.dart';
import 'package:logbook_app/Pages/home.dart';
import 'package:logbook_app/Pages/logbook.dart';
import 'package:logbook_app/Pages/report.dart';
import 'package:logbook_app/Pages/profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<_NavItem> _navItems = [
    _NavItem(icon: Icons.home, label: 'Home'),
    _NavItem(icon: Icons.menu_book, label: 'Logbook'),
    _NavItem(icon: Icons.description, label: 'Reports'),
    _NavItem(icon: Icons.person, label: 'Profile'),
  ];

  // CHANGED: removed const, added callback so LogBook's back arrow can return to Home
  late final List<Widget> _pages = [
    const Home(),
    LogBook(
      onBackToHome: () {
        setState(() {
          _selectedIndex = 0;
        });
      },
    ),
    Report(
    onBackToHome: () {
      setState(() {
        _selectedIndex = 0;
      });
    },
  ),
   Profile(onBackToHome: () => setState(() => _selectedIndex = 0)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF2FF),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      padding: EdgeInsets.only(
        top: 14,
        bottom: 14 + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF2FF),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_navItems.length, (index) {
          final bool isSelected = _selectedIndex == index;
          final Color activeColor = const Color(0xFF3B82F6);
          final Color inactiveColor = Color(0xFF000000);

          return GestureDetector(
            onTap: () => _onItemTapped(index),
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _navItems[index].icon,
                  color: isSelected ? activeColor : inactiveColor,
                ),
                const SizedBox(height: 4),
                Text(
                  _navItems[index].label,
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? activeColor : inactiveColor,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;

  _NavItem({required this.icon, required this.label});
}