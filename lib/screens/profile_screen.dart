import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Karbari', style: TextStyle(color: Colors.white)), // Profile Karbari
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
                  backgroundImage: Image.asset('assets/images/boy.png').image, // Tasvire profile
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      // TODO: Emkane taghir tasvire profile
                      print('Taghir tasvire profile'); // Taghir tasvire profile
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
              title: 'Etelaat Shakhsi', // Etelaat Shakhsi
              subtitle: 'Name, email, shomare hamrah', // Name, email, shomare hamrah
              onTap: () {
                // TODO: Safhe virayesh etelaat shakhsi
                print('Virayesh etelaat shakhsi'); // Virayesh etelaat shakhsi
              },
            ),
            _buildProfileInfoCard(
              icon: Icons.lock,
              title: 'Taghir Ramz Obour', // Taghir Ramz Obour
              subtitle: 'Ramz obour khod ra taghir dahid', // Ramz obour khod ra taghir dahid
              onTap: () {
                // TODO: Safhe taghir ramz obour
                print('Taghir ramz obour'); // Taghir ramz obour
              },
            ),
            _buildProfileInfoCard(
              icon: Icons.settings,
              title: 'Tanzimat', // Tanzimat
              subtitle: 'Tanzimate karbari va app', // Tanzimate karbari va app
              onTap: () {
                // TODO: Safhe tanzimat
                print('Tanzimat'); // Tanzimat
              },
            ),
            _buildProfileInfoCard(
              icon: Icons.help_outline,
              title: 'Pushtibani', // Pushtibani
              subtitle: 'Tamase ba pushtibani', // Tamase ba pushtibani
              onTap: () {
                // TODO: Safhe pushtibani
                print('Pushtibani'); // Pushtibani
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
                'Khorooj Az Hesab', // Khorooj Az Hesab
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