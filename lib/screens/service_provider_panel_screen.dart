//File : provider_panel_screen.dart

import 'package:flutter/material.dart';

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
            ),
            _buildFeatureCard(
              'Document Upload (P1)', // آپلود مدارک
              'Upload required documents for authentication.', // آپلود مدارک...
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Service Management'), // مدیریت سرویس‌ها
            _buildFeatureCard(
              'Receive Requests (P1)', // دریافت درخواست‌ها
              'Display service requests, accept or reject requests.', // نمایش درخواست‌های...
            ),
            _buildFeatureCard(
              'Change Status (P1)', // تغییر وضعیت
              'Go online/offline.', // آنلاین/آفلاین شدن
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Finance and Revenue'), // مالی و درآمد
            _buildFeatureCard(
              'View Revenue (P2)', // مشاهده درآمد
              'Display daily revenue, platform commission, and net amount.', // نمایش درآمد...
            ),
            _buildFeatureCard(
              'Service History (P2)', // تاریخچه سرویس‌ها
              'View details of past services.', // مشاهده جزئیات...
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Rating and Feedback'), // امتیاز و بازخورد
            _buildFeatureCard(
              'View Ratings and Comments (P3)', // مشاهده امتیازات و نظرات
              'View user ratings and comments.', // مشاهده امتیازات...
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('In-App Communication'), // امکان مکالمه درون برنامه
            _buildFeatureCard(
              'Chat with Service Consumer (REST API) (P2)', // چت با سرویس گیرنده (REST API)
              'Chat with service consumer using REST API.', // چت کردن...
            ),
            _buildFeatureCard(
              'Chat with Service Consumer (WebSocket) (P3)', // چت با سرویس گیرنده (WebSocket)
              'Chat with service consumer using WebSocket.', // چت کردن...
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

  Widget _buildFeatureCard(String title, String description) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
    );
  }
}
