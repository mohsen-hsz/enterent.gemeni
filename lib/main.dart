// File: main.dart

import 'package:flutter/material.dart';
import 'package:hotel_reservation_app/screens/detail_page.dart';
import 'package:hotel_reservation_app/screens/login_screen.dart';
import 'package:hotel_reservation_app/screens/signup_screen.dart';
import 'package:hotel_reservation_app/screens/home_screen.dart';
import 'package:hotel_reservation_app/screens/admin_panel_screen.dart';
import 'package:hotel_reservation_app/screens/service_provider_panel_screen.dart';
import 'package:hotel_reservation_app/screens/service_consumer_panel_screen.dart';
import 'package:hotel_reservation_app/screens/profile_screen.dart';
import 'package:hotel_reservation_app/screens/reservations_screen.dart';
import 'package:hotel_reservation_app/screens/reservation_history_screen.dart';
import 'package:hotel_reservation_app/screens/my_wallet_screen.dart';
import 'package:hotel_reservation_app/screens/personal_info_screen.dart';
import 'package:hotel_reservation_app/screens/change_password_screen.dart';
import 'package:hotel_reservation_app/screens/settings_screen.dart';
import 'package:hotel_reservation_app/screens/support_screen.dart';
import 'package:hotel_reservation_app/screens/add_hotel_listing_screen.dart';
import 'package:hotel_reservation_app/screens/provider_registration_screen.dart'; // New import
import 'package:hotel_reservation_app/screens/provider_requests_screen.dart'; // New import
import 'package:hotel_reservation_app/screens/provider_status_screen.dart'; // New import
import 'package:hotel_reservation_app/screens/provider_revenue_screen.dart'; // New import
import 'package:hotel_reservation_app/screens/provider_service_history_screen.dart'; // New import
import 'package:hotel_reservation_app/screens/provider_ratings_feedback_screen.dart'; // New import
import 'package:hotel_reservation_app/screens/provider_chat_screen.dart'; // New import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Reservation App', // اپلیکیشن رزرو هتل
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter', // فونت Inter را استفاده می‌کنیم
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/signup': (context) => const Signup(),
        '/home': (context) => const HomeScreen(),
        '/admin_panel': (context) => const AdminPanelScreen(),
        '/service_provider_panel': (context) => const ServiceProviderPanelScreen(),
        '/service_consumer_panel': (context) => const ServiceConsumerPanelScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/reservations': (context) => const ReservationsScreen(),
        '/reservation_history': (context) => const ReservationHistoryScreen(),
        '/my_wallet': (context) => const MyWalletScreen(),
        '/personal_info': (context) => const PersonalInfoScreen(),
        '/change_password': (context) => const ChangePasswordScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/support': (context) => const SupportScreen(),
        '/detail_page': (context) => const DetailPage(),
        '/add_hotel_listing': (context) => const AddHotelListingScreen(),
        '/provider_registration': (context) => const ProviderRegistrationScreen(), // New route
        '/provider_requests': (context) => const ProviderRequestsScreen(), // New route
        '/provider_status': (context) => const ProviderStatusScreen(), // New route
        '/provider_revenue': (context) => const ProviderRevenueScreen(), // New route
        '/provider_service_history': (context) => const ProviderServiceHistoryScreen(), // New route
        '/provider_ratings_feedback': (context) => const ProviderRatingsFeedbackScreen(), // New route
        '/provider_chat': (context) => const ProviderChatScreen(), // New route
      },
    );
  }
}
