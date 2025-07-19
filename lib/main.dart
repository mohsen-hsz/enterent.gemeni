import 'package:flutter/material.dart';
import 'package:hotel_reservation_app/screens/login_screen.dart';
import 'package:hotel_reservation_app/screens/signup_screen.dart';
import 'package:hotel_reservation_app/screens/home_screen.dart';
import 'package:hotel_reservation_app/screens/admin_panel_screen.dart';
import 'package:hotel_reservation_app/screens/service_provider_panel_screen.dart';
import 'package:hotel_reservation_app/screens/service_consumer_panel_screen.dart';
import 'package:hotel_reservation_app/screens/profile_screen.dart';
import 'package:hotel_reservation_app/screens/reservations_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Reservation App', // Hotel Reservation App
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter', // Font Inter ro estefade mikonim
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/admin_panel': (context) => const AdminPanelScreen(),
        '/service_provider_panel': (context) => const ServiceProviderPanelScreen(),
        '/service_consumer_panel': (context) => const ServiceConsumerPanelScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/reservations': (context) => const ReservationsScreen(),
      },
    );
  }
}