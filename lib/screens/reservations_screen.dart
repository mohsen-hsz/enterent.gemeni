//File " reservations_screen.dart

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
              'assets/images/incoming.png', // آیکون رزروهای پیش رو
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Upcoming Reservations Page', // صفحه رزروهای پیش رو
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 10),
            const Text(
              'Your upcoming reservations will be displayed here.', // رزروهای آینده شما در اینجا نمایش داده خواهد شد.
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
