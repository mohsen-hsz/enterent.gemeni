// File: screens/provider_service_history_screen.dart
import 'package:flutter/material.dart';

class ProviderServiceHistoryScreen extends StatelessWidget {
  const ProviderServiceHistoryScreen({super.key});

  // اطلاعات ساختگی برای تاریخچه سرویس‌ها (رزروهای گذشته)
  final List<Map<String, dynamic>> _mockServiceHistory = const [
    {
      'id': 'SRV001',
      'userName': 'Ali Karimi',
      'hotelName': 'My Hotel (Example)', // نام هتل سرویس‌دهنده
      'checkIn': '2024-05-10',
      'checkOut': '2024-05-15',
      'price': '1,250,000 Toman',
      'status': 'Completed',
    },
    {
      'id': 'SRV002',
      'userName': 'Narges Ahmadi',
      'hotelName': 'My Hotel (Example)',
      'checkIn': '2023-11-20',
      'checkOut': '2023-11-22',
      'price': '700,000 Toman',
      'status': 'Completed',
    },
    {
      'id': 'SRV003',
      'userName': 'Hassan Rezai',
      'hotelName': 'My Hotel (Example)',
      'checkIn': '2023-08-01',
      'checkOut': '2023-08-05',
      'price': '950,000 Toman',
      'status': 'Cancelled',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service History', style: TextStyle(color: Colors.white)), // تاریخچه سرویس
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _mockServiceHistory.isEmpty
          ? const Center(
        child: Text(
          'No service history available.', // تاریخچه سرویسی موجود نیست.
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _mockServiceHistory.length,
        itemBuilder: (context, index) {
          final service = _mockServiceHistory[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Service ID: ${service['id']}', // شناسه سرویس:
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'User: ${service['userName']}', // کاربر:
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Hotel: ${service['hotelName']}', // هتل:
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 8),
                  Text('Check-in: ${service['checkIn']}'), // تاریخ ورود:
                  Text('Check-out: ${service['checkOut']}'), // تاریخ خروج:
                  const SizedBox(height: 8),
                  Text(
                    'Amount: ${service['price']}', // مبلغ:
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Status: ${service['status']}', // وضعیت:
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: service['status'] == 'Completed'
                          ? Colors.green
                          : (service['status'] == 'Cancelled' ? Colors.red : Colors.orange),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: OutlinedButton(
                      onPressed: () {
                        // TODO: قابلیت مشاهده جزئیات بیشتر سرویس
                        print('View Details for Service ${service['id']}'); // مشاهده جزئیات سرویس
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.blue.shade700,
                        side: BorderSide(color: Colors.blue.shade700),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: const Text('View Details'), // مشاهده جزئیات
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

