// File: screens/hotelier_profile_screen.dart
import 'package:flutter/material.dart';

class HotelierProfileScreen extends StatelessWidget {
  const HotelierProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotelier Profile', style: TextStyle(color: Colors.white)), // پروفایل هتل‌دار
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
                  backgroundImage: Image.asset('assets/images/boy.jpg').image, // تصویر پروفایل هتل‌دار
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      // TODO: Functionality to change profile picture
                      print('Change Hotelier Profile Image'); // تغییر تصویر پروفایل هتل‌دار
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
              'Mohsen Hosseini (Hotelier)', // نام هتل‌دار
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'mohsen.hotelier@example.com', // ایمیل هتل‌دار
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            _buildProfileInfoCard(
              icon: Icons.hotel,
              title: 'My Listed Hotels', // هتل‌های لیست شده من
              subtitle: 'Manage your hotel listings', // مدیریت لیست هتل‌های شما
              onTap: () {
                // هدایت به صفحه اصلی هتل‌دار که لیست هتل‌ها را نشان می‌دهد
                Navigator.pop(context); // بستن پروفایل
                Navigator.pushReplacementNamed(context, '/hotelier_home');
                print('Navigate to My Listed Hotels');
              },
            ),
            _buildProfileInfoCard(
              icon: Icons.attach_money,
              title: 'Earnings Summary', // خلاصه درآمد
              subtitle: 'View your revenue and transactions', // مشاهده درآمد و تراکنش‌های شما
              onTap: () {
                Navigator.pushNamed(context, '/provider_revenue');
                print('Navigate to Earnings Summary');
              },
            ),
            _buildProfileInfoCard(
              icon: Icons.settings,
              title: 'Account Settings', // تنظیمات حساب
              subtitle: 'Manage your account preferences', // مدیریت تنظیمات حساب شما
              onTap: () {
                Navigator.pushNamed(context, '/settings'); // استفاده از صفحه تنظیمات عمومی
                print('Navigate to Account Settings');
              },
            ),
            _buildProfileInfoCard(
              icon: Icons.help_outline,
              title: 'Support', // پشتیبانی
              subtitle: 'Contact support team', // تماس با تیم پشتیبانی
              onTap: () {
                Navigator.pushNamed(context, '/support'); // استفاده از صفحه پشتیبانی عمومی
                print('Navigate to Support');
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/'); // بازگشت به صفحه ورود
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
                'Logout', // خروج
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
