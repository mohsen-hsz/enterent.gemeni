import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                    'assets/images/login.png', // تصویر ورود
                    height: 150,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Vorood Be Hesab Karbari', // ورود به حساب کاربری
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email Ya Shomare Hamrah', // ایمیل یا شماره همراه
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.person),
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
                      print('Login button pressed, navigating to /home'); // برای دیباگ: کلیک روی دکمه ورود
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
                      'Vorood', // ورود
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      print('Signup text button pressed, navigating to /signup'); // برای دیباگ: کلیک روی دکمه ثبت‌نام
                      Navigator.pushNamed(context, '/signup'); // به صفحه ثبت نام می‌رویم
                    },
                    child: Text(
                      'Hesab Nadarid? Sabt Nam Konid', // حساب ندارید؟ ثبت نام کنید
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