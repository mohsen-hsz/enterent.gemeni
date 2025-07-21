// File: screens/provider_status_screen.dart
import 'package:flutter/material.dart';

class ProviderStatusScreen extends StatefulWidget {
  const ProviderStatusScreen({super.key});

  @override
  State<ProviderStatusScreen> createState() => _ProviderStatusScreenState();
}

class _ProviderStatusScreenState extends State<ProviderStatusScreen> {
  bool _isOnline = false; // وضعیت آنلاین/آفلاین بودن

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Status', style: TextStyle(color: Colors.white)), // تغییر وضعیت
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Set Your Availability', // وضعیت در دسترس بودن خود را تنظیم کنید
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Go Online / Offline'), // آنلاین / آفلاین شوید
              trailing: Switch(
                value: _isOnline,
                onChanged: (bool value) {
                  setState(() {
                    _isOnline = value;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('You are now ${_isOnline ? 'Online' : 'Offline'}'), // شما اکنون آنلاین/آفلاین هستید
                    ),
                  );
                },
                activeColor: Colors.green,
                inactiveThumbColor: Colors.red,
                inactiveTrackColor: Colors.red.shade100,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Current Status: ${_isOnline ? 'Online' : 'Offline'}', // وضعیت فعلی: آنلاین/آفلاین
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _isOnline ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
