import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.png', // تصویر پس‌زمینه
              fit: BoxFit.cover,
            ),
          ),
          // Wave image at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/wave.png', // تصویر موج
              fit: BoxFit.fitWidth,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/signup.png', // تصویر ثبت نام
                    height: 150,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Sabt Nam Jadid', // ثبت نام جدید
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name Kamel', // نام کامل
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.person_outline),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email', // ایمیل
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.email),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Shomare Hamrah', // شماره همراه
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.phone),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Ramz Obour', // رمز عبور
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      print('Signup button pressed, navigating to /home'); // برای دیباگ: کلیک روی دکمه ثبت‌نام
                      Navigator.pushReplacementNamed(context, '/home'); // به صفحه اصلی می‌رویم
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.blue.shade700,
                      foregroundColor: Colors.white,
                      elevation: 5,
                    ),
                    child: const Text(
                      'Sabt Nam', // ثبت نام
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      print('Login text button pressed, popping to previous screen'); // برای دیباگ: کلیک روی دکمه ورود
                      Navigator.pop(context); // به صفحه قبل (ورود) برمی‌گردیم
                    },
                    child: Text(
                      'Hesab Darid? Vorood Konid', // حساب دارید؟ وارد شوید
                      style: TextStyle(color: Colors.blue.shade700, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
