import 'package:bkey_user/views/home_view.dart';
import 'package:bkey_user/views/notification_view.dart';
import 'package:bkey_user/views/setting_view.dart';
import 'package:bkey_user/app_colors.dart';
import 'package:bkey_user/views/ticket_view.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _TabNavigationState();
}

class _TabNavigationState extends State<BottomNav> {
  int _currentIndex = 0;

  final _pages = const [HomeScreen(), TicketScreen(), NotificationScreen(), SettingScreen()];

  @override
  void initState() {
    super.initState();
    // Show the message when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showUnderConstructionMessage();
    });
  }

  void _showUnderConstructionMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Our app is currently under development. All features will be available soon!',
          style: TextStyle(fontSize: 14),
        ),
        duration: const Duration(seconds: 15), // lasts 15 seconds
        backgroundColor: Colors.blueGrey.shade900,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -2))],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(image: 'assets/images/home.png', label: 'Home', index: 0),
              _buildNavItem(image: 'assets/images/ticket.png', label: 'Tickets', index: 1),
              _buildNavItem(image: 'assets/images/notification.png', label: 'Notification', index: 2),
              _buildNavItem(image: 'assets/images/setting.png', label: 'Setting', index: 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String image,
    required String label,
    required int index,
  }) {
    final isSelected = _currentIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () {
          _showUnderConstructionMessage();
          setState(() {
            _currentIndex = index;
          });
          
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                image,
                width: 26,
                height: 26,
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected ? AppColors.primary : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
