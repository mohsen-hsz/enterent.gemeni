//File : profile_page.dart

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile', style: TextStyle(color: Colors.white)), // Profile Karbari
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: Image.asset('assets/images/boy.jpg').image, // Tasvire profile
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      // TODO: Emkane taghir tasvire profile
                      print('Change The Profile Image'); // Taghir tasvire profile
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade700,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Ali Ahmadi', // Name karbar
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'ali.ahmadi@example.com', // Email karbar
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            _buildProfileInfoCard(
              icon: Icons.person,
              title: 'Personal Information', // Etelaat Shakhsi
              subtitle: 'Name, email, Contact Number', // Name, email, shomare hamrah
              onTap: () {
                // TODO: Safhe virayesh etelaat shakhsi
                print('Edit Personal Information'); // Virayesh etelaat shakhsi
              },
            ),
            _buildProfileInfoCard(
              icon: Icons.lock,
              title: 'Change The PassWord', // Taghir Ramz Obour
              subtitle: 'Change Your PassWord', // Ramz obour khod ra taghir dahid
              onTap: () {
                // TODO: Safhe taghir ramz obour
                print('Change The PassWord'); // Taghir ramz obour
              },
            ),
            _buildProfileInfoCard(
              icon: Icons.settings,
              title: 'Setting', // Tanzimat
              subtitle: 'User and App Setting', // Tanzimate karbari va app
              onTap: () {
                // TODO: Safhe tanzimat
                print('Setting'); // Tanzimat
              },
            ),
            _buildProfileInfoCard(
              icon: Icons.help_outline,
              title: 'Support', // Pushtibani
              subtitle: 'Call With Support', // Tamase ba pushtibani
              onTap: () {
                // TODO: Safhe pushtibani
                print('Support'); // Pushtibani
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/'); // Be safhe login bar migardim
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.red.shade600,
                foregroundColor: Colors.white,
                elevation: 5,
              ),
              icon: const Icon(Icons.logout),
              label: const Text(
                'Exit From The Account', // Khorooj Az Hesab
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue.shade700, size: 30),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
        onTap: onTap,
      ),
    );
  }
}