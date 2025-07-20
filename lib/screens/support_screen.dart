// File: screens/support_screen.dart
import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support', style: TextStyle(color: Colors.white)), // پشتیبانی
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'How can we help you?', // چگونه می‌توانیم به شما کمک کنیم؟
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.blue),
              title: const Text('Email Support'), // پشتیبانی ایمیلی
              subtitle: const Text('Send us an email with your query'), // سوال خود را از طریق ایمیل برای ما ارسال کنید
              onTap: () {
                // TODO: قابلیت ارسال ایمیل
                print('Email Support tapped'); // پشتیبانی ایمیلی لمس شد
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.blue),
              title: const Text('Call Us'), // با ما تماس بگیرید
              subtitle: const Text('Call our support hotline'), // با خط پشتیبانی ما تماس بگیرید
              onTap: () {
                // TODO: قابلیت تماس تلفنی
                print('Call Us tapped'); // با ما تماس بگیرید لمس شد
              },
            ),
            ListTile(
              leading: const Icon(Icons.chat, color: Colors.blue),
              title: const Text('Live Chat'), // چت زنده
              subtitle: const Text('Chat with a support agent in real-time'), // با یک نماینده پشتیبانی به صورت زنده چت کنید
              onTap: () {
                // TODO: قابلیت چت زنده
                print('Live Chat tapped'); // چت زنده لمس شد
              },
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(
                'Our support team is available 24/7.', // تیم پشتیبانی ما 24/7 در دسترس است.
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
