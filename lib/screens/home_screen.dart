//File : home_screen.dart

import 'package:flutter/material.dart';
import 'package:hotel_reservation_app/screens/profile_screen.dart';
import 'package:hotel_reservation_app/screens/reservations_screen.dart';
import 'package:hotel_reservation_app/screens/home_content.dart';
import 'package:hotel_reservation_app/screens/reservation_history_screen.dart';
import 'package:hotel_reservation_app/screens/my_wallet_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Index for bottom navigation bar

  // List of widgets to display for each tab in bottom navigation
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeContent(), // Home content
    const ReservationsScreen(), // Reservations screen
    const ProfileScreen(), // Profile screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page', style: TextStyle(color: Colors.white)), // صفحه اصلی
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: Image.asset('assets/images/boy.jpg').image, // تصویر پروفایل کاربر
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Hello, User!', // سلام، کاربر!
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Image.asset('assets/images/user.png', width: 24, height: 24), // آیکون کاربر
              title: const Text('My Profile'), // پروفایل من
              onTap: () {
                Navigator.pop(context); // Close the drawer
                _onItemTapped(2); // Navigate to Profile (index 2 in _widgetOptions)
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/incoming.png', width: 24, height: 24), // آیکون رزروهای پیش رو
              title: const Text('Upcoming Reservations'), // رزروهای پیش رو
              onTap: () {
                Navigator.pop(context); // Close the drawer
                _onItemTapped(1); // Navigate to Reservations (index 1 in _widgetOptions)
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/past.png', width: 24, height: 24), // آیکون تاریخچه
              title: const Text('Reservation History'), // تاریخچه رزروها
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, '/reservation_history'); // Navigate to Reservation History
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/wallet.png', width: 24, height: 24), // آیکون کیف پول
              title: const Text('My Wallet'), // کیف پول من
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, '/my_wallet'); // Navigate to My Wallet
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.admin_panel_settings, color: Colors.blue),
              title: const Text('Management Panel'), // پنل مدیریت
              onTap: () {
                Navigator.pushNamed(context, '/admin_panel');
              },
            ),
            ListTile(
              leading: const Icon(Icons.business_center, color: Colors.blue),
              title: const Text('Service Provider Panel'), // پنل سرویس دهنده
              onTap: () {
                Navigator.pushNamed(context, '/service_provider_panel');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_pin, color: Colors.blue),
              title: const Text('Service Consumer Panel'), // پنل سرویس گیرنده
              onTap: () {
                Navigator.pushNamed(context, '/service_consumer_panel');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout'), // خروج
              onTap: () {
                Navigator.pushReplacementNamed(context, '/'); // Return to login page
              },
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex), // Display content based on selected index
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/hotel.png', width: 24, height: 24), // آیکون هتل
            label: 'Hotels', // هتل‌ها
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/incoming.png', width: 24, height: 24), // آیکون رزروها
            label: 'Reservations', // رزروها
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/user.png', width: 24, height: 24), // آیکون پروفایل
            label: 'Profile', // پروفایل
          ),
        ],
        currentIndex: _selectedIndex, // Current selected index
        selectedItemColor: Colors.blue.shade700,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped, // Handle bottom navigation tap
      ),
    );
  }
}
