// File: screens/role_selection_screen.dart

import 'package:flutter/material.dart';
import 'package:hotel_reservation_app/screens/traveler_home_screen.dart'; // Import برای مسافر
import 'package:hotel_reservation_app/screens/hotelier_home_screen.dart'; // Import برای هتل‌دار


class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // No AppBar to allow the gradient to cover the entire screen
      body: Container(
        // Applying a linear gradient background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 223, 219, 225), // Deep Purple
              Color.fromARGB(255, 2, 136, 245), // Blue
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Image/Icon for the screen
                const Icon(
                  Icons.vpn_key_rounded, // A key icon to represent selection/access
                  size: 120, // Larger size for prominence
                  color: Color.fromARGB(255, 54, 0, 202), // White color for contrast on gradient
                ),
                const SizedBox(height: 30), // Spacing below the icon

                // Title text prompting user to choose a role
                const Text(
                  'As Who do you want to Login ?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White text for better readability on gradient
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black38,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50), // Spacing below the title

                // Row for the two square buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribute space evenly
                  children: [
                    // Button for "Traveler" role
                    SizedBox(
                      width: 150, // Fixed width for square shape
                      height: 150, // Fixed height for square shape
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to TravelerHomeScreen when "Traveler" is selected.
                          Navigator.pushReplacementNamed(
                            context,
                            '/traveler_home', // مسیر جدید برای مسافر
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color.fromARGB(255, 54, 0, 202), // Icon and text color
                          backgroundColor: Colors.white, // Button background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20), // More rounded corners
                          ),
                          elevation: 10, // More shadow for depth
                          padding: const EdgeInsets.all(10), // Inner padding
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person, size: 60), // Larger icon
                            SizedBox(height: 10),
                            Text(
                              'Traveler',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20), // Spacing between buttons

                    // Button for "Hotelier" role
                    SizedBox(
                      width: 150, // Fixed width for square shape
                      height: 150, // Fixed height for square shape
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to HotelierHomeScreen when "Hotelier" is selected.
                          Navigator.pushReplacementNamed(
                            context,
                            '/hotelier_home', // مسیر جدید برای هتل‌دار
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color.fromARGB(255, 54, 0, 202), // Icon and text color
                          backgroundColor: Colors.white, // Button background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20), // More rounded corners
                          ),
                          elevation: 10, // More shadow for depth
                          padding: const EdgeInsets.all(10), // Inner padding
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.hotel, size: 60), // Larger icon
                            SizedBox(height: 10),
                            Text(
                              'Hotelier',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
