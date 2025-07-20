import 'package:flutter/material.dart';

class ServiceConsumerPanelScreen extends StatelessWidget {
  const ServiceConsumerPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Consumer Panel', style: TextStyle(color: Colors.white)), // پنل سرویس گیرنده
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Registration and Login'), // ثبت نام و ورود
            _buildFeatureCard(
              'Register with Mobile/Email (P1)', // ثبت نام با شماره همراه/ایمیل
              'User registration with mobile number or email.', // ثبت نام کاربر...
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Service Request'), // درخواست سرویس
            _buildFeatureCard(
              'Select Service Type (P1)', // انتخاب نوع سرویس
              'Select service type relevant to the project.', // انتخاب نوع سرویس...
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Service Status Tracking'), // پیگیری وضعیت سرویس
            _buildFeatureCard(
              'Service Provider Information (P1)', // اطلاعات سرویس دهنده
              'Service provider details and service status.', // مشخصات سرویس دهنده...
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Payment'), // پرداخت
            _buildFeatureCard(
              'Payment Methods (P2)', // روش‌های پرداخت
              'Cash, internal wallet, bank card.', // نقدی، کیف پول...
            ),
            _buildFeatureCard(
              'Discounts and Coupons (P2)', // تخفیف‌ها و کوپن‌ها
              'Apply discount codes for trips.', // اعمال کد تخفیف...
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('History and Reviews (P3)'), // تاریخچه و نظرات
            _buildFeatureCard(
              'Rate Service Provider', // امتیازدهی به سرویس دهنده
              'Rate the service provider after service completion.', // امتیاز دهی...
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('In-App Communication'), // امکان مکالمه درون برنامه
            _buildFeatureCard(
              'Chat with Service Provider (REST API) (P2)', // چت با سرویس دهنده (REST API)
              'Chat with service provider using REST API.', // چت کردن...
            ),
            _buildFeatureCard(
              'Chat with Service Provider (WebSocket) (P3)', // چت با سرویس دهنده (WebSocket)
              'Chat with service provider using WebSocket.', // چت کردن...
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
