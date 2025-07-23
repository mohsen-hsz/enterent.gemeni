// File: screens/user_detail_screen.dart

import 'package:flutter/material.dart';

class UserDetailScreen extends StatelessWidget {
  final Map<String, dynamic> user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // داده‌های نمونه برای رزروها و تراکنش‌ها (اینها باید از API دریافت شوند)
    final List<Map<String, String>> reservations = [
      {'date': '2025-07-10', 'hotel': 'Hotel Iran', 'price': '1,200,000 Toman'},
      {'date': '2025-06-15', 'hotel': 'Pars Hotel', 'price': '900,000 Toman'},
    ];

    final List<Map<String, String>> transactions = [
      {'date': '2025-07-01', 'amount': '1,200,000 Toman', 'type': 'Payment'},
      {'date': '2025-06-20', 'amount': '900,000 Toman', 'type': 'Refund'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('${user['name']} Details'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            _sectionTitle('1. User Info'), // اطلاعات کاربر
            Card(
              margin: const EdgeInsets.only(bottom: 12.0),
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: user['role'] == 'Traveler' ? Colors.blue.shade100 : Colors.orange.shade100,
                  child: Icon(
                    user['role'] == 'Traveler' ? Icons.person : Icons.hotel,
                    color: user['role'] == 'Traveler' ? Colors.blue.shade700 : Colors.orange.shade700,
                  ),
                ),
                title: Text('Name: ${user['name']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Role: ${user['role']} | ID: ${user['id']} | Status: ${user['status']}'),
              ),
            ),

            const SizedBox(height: 20),
            _sectionTitle('2. Reservation History'), // تاریخچه رزرو
            reservations.isEmpty
                ? const Text('No reservations found.', style: TextStyle(color: Colors.grey))
                : Column(
              children: reservations.map((res) => Card(
                margin: const EdgeInsets.only(bottom: 8.0),
                elevation: 1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: ListTile(
                  leading: const Icon(Icons.hotel, color: Colors.blue),
                  title: Text('Hotel: ${res['hotel']}'),
                  subtitle: Text('Date: ${res['date']}'),
                  trailing: Text(res['price']!),
                ),
              )).toList(),
            ),

            const SizedBox(height: 20),
            _sectionTitle('3. Financial Reports'), // گزارشات مالی
            transactions.isEmpty
                ? const Text('No transactions found.', style: TextStyle(color: Colors.grey))
                : Column(
              children: transactions.map((txn) => Card(
                margin: const EdgeInsets.only(bottom: 8.0),
                elevation: 1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: ListTile(
                  leading: const Icon(Icons.attach_money, color: Colors.green),
                  title: Text('Amount: ${txn['amount']}'),
                  subtitle: Text('Date: ${txn['date']}'),
                  trailing: Text(txn['type']!),
                ),
              )).toList(),
            ),

            const SizedBox(height: 20),
            _sectionTitle('4. Summary Report'), // گزارش خلاصه
            Card(
              margin: const EdgeInsets.only(bottom: 12.0),
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Reservations: ${reservations.length}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Total Transactions: ${transactions.length}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue.shade800),
      ),
    );
  }
}
