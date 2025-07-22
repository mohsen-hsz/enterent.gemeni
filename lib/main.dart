// File: main.dart

import 'package:flutter/material.dart';
import 'package:hotel_reservation_app/screens/detail_page.dart';
import 'package:hotel_reservation_app/screens/login_screen.dart';
import 'package:hotel_reservation_app/screens/signup_screen.dart';
import 'package:hotel_reservation_app/screens/traveler_home_screen.dart'; // تغییر نام
import 'package:hotel_reservation_app/screens/hotelier_home_screen.dart'; // جدید
import 'package:hotel_reservation_app/screens/management_panel_screen.dart'; // جدید: پنل مدیریت مشترک
import 'package:hotel_reservation_app/screens/profile_screen.dart'; // پروفایل مسافر
import 'package:hotel_reservation_app/screens/hotelier_profile_screen.dart'; // جدید: پروفایل هتل‌دار
import 'package:hotel_reservation_app/screens/reservations_screen.dart';
import 'package:hotel_reservation_app/screens/reservation_history_screen.dart';
import 'package:hotel_reservation_app/screens/my_wallet_screen.dart';
import 'package:hotel_reservation_app/screens/personal_info_screen.dart';
import 'package:hotel_reservation_app/screens/change_password_screen.dart';
import 'package:hotel_reservation_app/screens/settings_screen.dart';
import 'package:hotel_reservation_app/screens/support_screen.dart';
import 'package:hotel_reservation_app/screens/add_hotel_listing_screen.dart';
import 'package:hotel_reservation_app/screens/provider_registration_screen.dart';
import 'package:hotel_reservation_app/screens/provider_requests_screen.dart';
import 'package:hotel_reservation_app/screens/provider_status_screen.dart';
import 'package:hotel_reservation_app/screens/provider_revenue_screen.dart';
import 'package:hotel_reservation_app/screens/provider_service_history_screen.dart';
import 'package:hotel_reservation_app/screens/provider_ratings_feedback_screen.dart';
import 'package:hotel_reservation_app/screens/provider_chat_screen.dart';
import 'package:hotel_reservation_app/screens/role_selection_screen.dart';

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
        '/role_selection': (context) => const RoleSelectionScreen(),
        '/traveler_home': (context) => const TravelerHomeScreen(),
        '/hotelier_home': (context) => const HotelierHomeScreen(),
        '/management_panel': (context) => const ManagementPanelScreen(), // مسیر جدید: پنل مدیریت مشترک
        '/profile': (context) => const ProfileScreen(), // پروفایل مسافر
        '/hotelier_profile': (context) => const HotelierProfileScreen(), // جدید: پروفایل هتل‌دار
        '/reservations': (context) => const ReservationsScreen(),
        '/reservation_history': (context) => const ReservationHistoryScreen(),
        '/my_wallet': (context) => const MyWalletScreen(),
        '/personal_info': (context) => const PersonalInfoScreen(),
        '/change_password': (context) => const ChangePasswordScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/support': (context) => const SupportScreen(),
        '/detail_page': (context) => const DetailPage(),
        '/add_hotel_listing': (context) => const AddHotelListingScreen(),
        '/provider_registration': (context) => const ProviderRegistrationScreen(),
        '/provider_requests': (context) => const ProviderRequestsScreen(),
        '/provider_status': (context) => const ProviderStatusScreen(),
        '/provider_revenue': (context) => const ProviderRevenueScreen(),
        '/provider_service_history': (context) => const ProviderServiceHistoryScreen(),
        '/provider_ratings_feedback': (context) => const ProviderRatingsFeedbackScreen(),
        '/provider_chat': (context) => const ProviderChatScreen(),
      },
    );
  }
}
