// File: screens/settings_screen.dart
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.white)), // تنظیمات
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'App Settings', // تنظیمات اپلیکیشن
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text('Notifications'), // اعلان‌ها
              subtitle: const Text('Receive push notifications'), // دریافت اعلان‌های پوش
              value: true, // فرض می‌کنیم فعال است
              onChanged: (bool value) {
                // TODO: مدیریت تغییر وضعیت اعلان‌ها
                print('Notifications switch changed to $value'); // وضعیت اعلان‌ها تغییر کرد
              },
            ),
            SwitchListTile(
              title: const Text('Dark Mode'), // حالت تاریک
              subtitle: const Text('Enable dark theme'), // فعال کردن تم تاریک
              value: false, // فرض می‌کنیم غیرفعال است
              onChanged: (bool value) {
                // TODO: مدیریت تغییر وضعیت حالت تاریک
                print('Dark Mode switch changed to $value'); // وضعیت حالت تاریک تغییر کرد
              },
            ),
            ListTile(
              title: const Text('Language'), // زبان
              subtitle: const Text('English (US)'), // انگلیسی (ایالات متحده)
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // TODO: قابلیت تغییر زبان
                print('Language option tapped'); // گزینه زبان لمس شد
              },
            ),
            ListTile(
              title: const Text('Privacy Policy'), // سیاست حفظ حریم خصوصی
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // TODO: نمایش سیاست حفظ حریم خصوصی
                print('Privacy Policy tapped'); // سیاست حفظ حریم خصوصی لمس شد
              },
            ),
            ListTile(
              title: const Text('Terms of Service'), // شرایط خدمات
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // TODO: نمایش شرایط خدمات
                print('Terms of Service tapped'); // شرایط خدمات لمس شد
              },
            ),
          ],
        ),
      ),
    );
  }
}
