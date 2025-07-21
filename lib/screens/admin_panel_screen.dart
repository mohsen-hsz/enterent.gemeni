
//File: admin_panel_screen.dart

import 'package:flutter/material.dart';

class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Management Panel', style: TextStyle(color: Colors.white)), // پنل مدیریت
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Service Provider and Consumer Management'), // مدیریت سرویس دهنده و سرویس گیرنده
            _buildFeatureCard(
              'Service Provider Authentication (P1)', // تایید هویت سرویس دهنده
              'Review service provider documents, view list, activate/deactivate account.', // بررسی مدارک...
            ),
            _buildFeatureCard(
              'Service Consumer Management (P1)', // مدیریت سرویس گیرنده
              'View service consumer list, possibility to block account.', // مشاهده لیست...
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Service Management'), // مدیریت سرویس‌ها
            _buildFeatureCard(
              'View Active Services (P1)', // مشاهده سرویس‌های فعال
              'View service details, filter by relevant parameters.', // مشاهده جزئیات...
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Financial Management'), // مدیریت مالی
            _buildFeatureCard(
              'Revenue Calculation (P2)', // محاسبه درآمد
              'Daily/monthly revenue report.', // گزارش درآمد...
            ),
            _buildFeatureCard(
              'Transactions (P2)', // تراکنش‌ها
              'View service provider and consumer payment transactions.', // مشاهده تراکنش‌های...
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Reporting and Analysis'), // گزارش‌گیری و تحلیل
            _buildFeatureCard(
              'Service Provider Performance Report (P2)', // گزارش عملکرد سرویس دهندگان
              'Average rating, revenue amount.', // امتیاز متوسط...
            ),
            _buildFeatureCard(
              'Service Consumer Feedback Report (P2)', // گزارش نظرات سرویس گیرندگان
              'Display comments and ratings.', // نمایش نظرات...
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
