import 'package:flutter/material.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/incoming.png', // Icon incoming
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Safhe Rezervha', // Safhe Rezervha
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 10),
            const Text(
              'Inja list rezervhaye shoma namayesh dade khahad shod.', // Inja list rezervhaye shoma namayesh dade khahad shod.
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

