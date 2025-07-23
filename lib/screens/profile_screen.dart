// File: screens/profile_screen.dart

import 'package:flutter/material.dart';

import 'package:hotel_reservation_app/screens/personal_info_screen.dart'; // Import for Personal Information
import 'package:hotel_reservation_app/screens/change_password_screen.dart'; // Import for Change Password
import 'package:hotel_reservation_app/screens/settings_screen.dart'; // Import for Settings
import 'package:hotel_reservation_app/screens/support_screen.dart'; // Import for Support
import 'package:hotel_reservation_app/services/api_service.dart'; // برای logout


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile', style: TextStyle(color: Colors.white)), // پروفایل کاربری
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: Image.asset('assets/images/boy.jpg').image, // تصویر پروفایل
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      // TODO: Functionality to change profile picture
                      print('Change profile picture'); // تغییر تصویر پروفایل
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade700,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Ali Ahmadi', // نام کاربر
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'ali.ahmadi@example.com', //ایمیل کاربر
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            _buildProfileInfoCard(
              icon: Icons.person,
              title: 'Personal Information', // اطلاعات شخصی
              subtitle: 'Name, email, mobile number', // نام، ایمیل، شماره همراه
              onTap: () {
                Navigator.pushNamed(context, '/personal_info'); // Navigate to Personal Information screen
                print('Navigate to Personal Information'); // ویرایش اطلاعات شخصی
              },
            ),
            _buildProfileInfoCard(
              icon: Icons.lock,
              title: 'Change Password', //تغییر رمز عبور
              subtitle: 'Change your account password', // رمز عبور خود را تغییر دهید
              onTap: () {
                Navigator.pushNamed(context, '/change_password'); // Navigate to Change Password screen
                print('Navigate to Change Password'); // تغییر رمز عبور
              },
            ),
            _buildProfileInfoCard(
              icon: Icons.settings,
              title: 'Settings', // تنظیمات
              subtitle: 'User and app settings', // تنظیمات کاربری و اپلیکیشن
              onTap: () {
                Navigator.pushNamed(context, '/settings'); // Navigate to Settings screen
                print('Navigate to Settings'); // تنظیمات
              },
            ),
            _buildProfileInfoCard(
              icon: Icons.help_outline,
              title: 'Support', // پشتیبانی
              subtitle: 'Contact support', // تماس با پشتیبانی
              onTap: () {
                Navigator.pushNamed(context, '/support'); // Navigate to Support screen
                print('Navigate to Support'); // پشتیبانی
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                ApiService.deleteTokenAndUserId(); // حذف توکن و User ID هنگام خروج
                Navigator.pushReplacementNamed(context, '/'); // Return to login page
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.red.shade600,
                foregroundColor: Colors.white,
                elevation: 5,
              ),
              icon: const Icon(Icons.logout),
              label: const Text(
                'Logout', // خروج از حساب
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue.shade700, size: 30),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
        onTap: onTap,
      ),
    );
  }
}
