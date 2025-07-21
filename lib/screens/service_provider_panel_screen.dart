// File: screens/service_provider_panel_screen.dart

import 'package:flutter/material.dart';
import 'package:hotel_reservation_app/screens/provider_registration_screen.dart'; // Import جدید
import 'package:hotel_reservation_app/screens/provider_requests_screen.dart'; // Import جدید
import 'package:hotel_reservation_app/screens/provider_status_screen.dart'; // Import جدید
import 'package:hotel_reservation_app/screens/provider_revenue_screen.dart'; // Import جدید
import 'package:hotel_reservation_app/screens/provider_service_history_screen.dart'; // Import جدید
import 'package:hotel_reservation_app/screens/provider_ratings_feedback_screen.dart'; // Import جدید
import 'package:hotel_reservation_app/screens/provider_chat_screen.dart'; // Import جدید

class ServiceProviderPanelScreen extends StatelessWidget {
  const ServiceProviderPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Provider Panel', style: TextStyle(color: Colors.white)), // پنل سرویس دهنده
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Registration and Authentication'), // ثبت نام و احراز هویت
            _buildFeatureCard(
              'Personal Information Registration (P1)', // ثبت اطلاعات شخصی
              'User registration and personal information.', // ثبت نام کاربر...
              onTap: () {
                Navigator.pushNamed(context, '/provider_registration');
              },
            ),
            _buildFeatureCard(
              'Document Upload (P1)', // آپلود مدارک
              'Upload required documents for authentication.', // آپلود مدارک...
              onTap: () {
                Navigator.pushNamed(context, '/provider_registration'); // از همین صفحه ثبت نام استفاده می‌کنیم
              },
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Service Management'), // مدیریت سرویس‌ها
            _buildFeatureCard(
              'Receive Requests (P1)', // دریافت درخواست‌ها
              'Display service requests, accept or reject requests.', // نمایش درخواست‌های...
              onTap: () {
                Navigator.pushNamed(context, '/provider_requests');
              },
            ),
            _buildFeatureCard(
              'Change Status (P1)', // تغییر وضعیت
              'Go online/offline.', // آنلاین/آفلاین شدن
              onTap: () {
                Navigator.pushNamed(context, '/provider_status');
              },
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Finance and Revenue'), // مالی و درآمد
            _buildFeatureCard(
              'View Revenue (P2)', // مشاهده درآمد
              'Display daily revenue, platform commission, and net amount.', // نمایش درآمد...
              onTap: () {
                Navigator.pushNamed(context, '/provider_revenue');
              },
            ),
            _buildFeatureCard(
              'Service History (P2)', // تاریخچه سرویس‌ها
              'View details of past services.', // مشاهده جزئیات...
              onTap: () {
                Navigator.pushNamed(context, '/provider_service_history');
              },
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Rating and Feedback'), // امتیاز و بازخورد
            _buildFeatureCard(
              'View Ratings and Comments (P3)', // مشاهده امتیازات و نظرات
              'View user ratings and comments.', // مشاهده امتیازات...
              onTap: () {
                Navigator.pushNamed(context, '/provider_ratings_feedback');
              },
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('In-App Communication'), // امکان مکالمه درون برنامه
            _buildFeatureCard(
              'Chat with Service Consumer (P2/P3)', // چت با سرویس گیرنده
              'Chat with service consumer using REST API or WebSocket.', // چت کردن...
              onTap: () {
                Navigator.pushNamed(context, '/provider_chat');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue.shade800,
        ),
      ),
    );
  }

  // تغییر _buildFeatureCard برای دریافت onTap
  Widget _buildFeatureCard(String title, String description, {VoidCallback? onTap}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell( // استفاده از InkWell برای قابلیت کلیک
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
