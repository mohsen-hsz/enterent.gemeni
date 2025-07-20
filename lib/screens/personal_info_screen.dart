// File: screens/personal_info_screen.dart
import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Information', style: TextStyle(color: Colors.white)), // اطلاعات شخصی
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'User Details', // جزئیات کاربر
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            _buildInfoRow('Full Name', 'Ali Ahmadi'), // نام کامل
            _buildInfoRow('Email', 'ali.ahmadi@example.com'), // ایمیل
            _buildInfoRow('Mobile Number', '+98 912 345 6789'), // شماره همراه
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: قابلیت ویرایش اطلاعات
                  print('Edit Personal Info button pressed'); // دکمه ویرایش اطلاعات شخصی فشرده شد
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text('Edit Information'), // ویرایش اطلاعات
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 18, color: Colors.black87),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
