import 'package:flutter/material.dart';
import 'package:hotel_reservation_app/screens/profile_screen.dart';
import 'package:hotel_reservation_app/screens/reservations_screen.dart';
import 'package:hotel_reservation_app/screens/home_content.dart'; // Import home_content

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Index item entekhab shode dar bottom navigation bar

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeContent(), // Content asli safhe home
    const ReservationsScreen(), // Safhe rezervha
    const ProfileScreen(), // Safhe profile
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
        title: const Text('Safhe Asli', style: TextStyle(color: Colors.white)), // Safhe Asli
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
                    backgroundImage: Image.asset('assets/images/boy.png').image, // Tasvire profile user
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Salam, Karbar!', // Salam, Karbar!
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Image.asset('assets/images/user.png', width: 24, height: 24), // Icon user
              title: const Text('Profile Man'), // Profile Man
              onTap: () {
                Navigator.pop(context); // Drawer ro mibandim
                _onItemTapped(2); // Be safhe profile mirim (index 2)
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/incoming.png', width: 24, height: 24), // Icon incoming
              title: const Text('Rezervhaye Pish Ro'), // Rezervhaye Pish Ro
              onTap: () {
                Navigator.pop(context); // Drawer ro mibandim
                _onItemTapped(1); // Be safhe rezervha mirim (index 1)
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/past.png', width: 24, height: 24), // Icon past
              title: const Text('Tarikhche Rezervha'), // Tarikhche Rezervha
              onTap: () {
                // TODO: Safhe tarikhche rezervha
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/wallet.png', width: 24, height: 24), // Icon wallet
              title: const Text('Kife Pool Man'), // Kife Pool Man
              onTap: () {
                // TODO: Safhe kife pool
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.admin_panel_settings, color: Colors.blue),
              title: const Text('Panel Modiriat'), // Panel Modiriat
              onTap: () {
                Navigator.pushNamed(context, '/admin_panel');
              },
            ),
            ListTile(
              leading: const Icon(Icons.business_center, color: Colors.blue),
              title: const Text('Panel Servis Dahande'), // Panel Servis Dahande
              onTap: () {
                Navigator.pushNamed(context, '/service_provider_panel');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_pin, color: Colors.blue),
              title: const Text('Panel Servis Girande'), // Panel Servis Girande
              onTap: () {
                Navigator.pushNamed(context, '/service_consumer_panel');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Khorooj'), // Khorooj
              onTap: () {
                Navigator.pushReplacementNamed(context, '/'); // Be safhe login bar migardim
              },
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex), // Namayesh content bar asase index entekhab shode
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/hotel.png', width: 24, height: 24), // Icon hotel
            label: 'Hotelha', // Hotelha
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/incoming.png', width: 24, height: 24), // Icon incoming
            label: 'Rezervha', // Rezervha
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/user.png', width: 24, height: 24), // Icon user
            label: 'Profile', // Profile
          ),
        ],
        currentIndex: _selectedIndex, // Index current entekhab shode
        selectedItemColor: Colors.blue.shade700,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped, // Tabdil index bottom navigation
      ),
    );
  }
}
