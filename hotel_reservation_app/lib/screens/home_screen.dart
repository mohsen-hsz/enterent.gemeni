import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                // TODO: Safhe profile user
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/incoming.png', width: 24, height: 24), // Icon incoming
              title: const Text('Rezervhaye Pish Ro'), // Rezervhaye Pish Ro
              onTap: () {
                // TODO: Safhe rezervhaye pish ro
                Navigator.pop(context);
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset('assets/images/home.jpg').image, // Tasvire home
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.6),
                    ],
                  ),
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
                ),
                child: const Text(
                  'Be Hotel Reservation App Khosh Amadid!', // Be Hotel Reservation App Khosh Amadid!
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Hotelhaye Pishnahadi', // Hotelhaye Pishnahadi
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildHotelCard('Hotel Tehran', 'assets/images/hotel1.jpg'), // Hotel 1
                  const SizedBox(width: 15),
                  _buildHotelCard('Hotel Shiraz', 'assets/images/hotel2.jpg'), // Hotel 2
                  const SizedBox(width: 15),
                  _buildHotelCard('Hotel Esfahan', 'assets/images/hotel3.jpg'), // Hotel 3
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Maghsadhaye Mahboub', // Maghsadhaye Mahboub
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildDestinationCard('Bali', 'assets/images/bali.jpg'), // Bali
                  const SizedBox(width: 15),
                  _buildDestinationCard('Dubai', 'assets/images/dubai.jpg'), // Dubai
                  const SizedBox(width: 15),
                  _buildDestinationCard('Mumbai', 'assets/images/mumbai.jpg'), // Mumbai
                  const SizedBox(width: 15),
                  _buildDestinationCard('New York', 'assets/images/newyork.jpg'), // New York
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
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
        selectedItemColor: Colors.blue.shade700,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // TODO: Handle bottom navigation tap
        },
      ),
    );
  }

  Widget _buildHotelCard(String title, String imagePath) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.amber.shade700, size: 18),
                const Text('4.5'),
                const Spacer(),
                Text(
                  'Az 250 Toman', // Az 250 Toman
                  style: TextStyle(color: Colors.blue.shade700, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinationCard(String title, String imagePath) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
