import 'package:flutter/material.dart';

class UserDetailScreen extends StatelessWidget {
  final Map<String, dynamic> user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // داده‌های نمونه برای رزروها و تراکنش‌ها
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

            _sectionTitle('1. User Info Form'),
            Card(
              child: ListTile(
                title: Text('Name: ${user['name']}'),
                subtitle: Text('Role: ${user['role']} | Status: ${user['status']}'),
              ),
            ),

            const SizedBox(height: 20),
            _sectionTitle('2. Reservation History'),
            ...reservations.map((res) => Card(
              child: ListTile(
                leading: const Icon(Icons.hotel),
                title: Text('Hotel: ${res['hotel']}'),
                subtitle: Text('Date: ${res['date']}'),
                trailing: Text(res['price']!),
              ),
            )),

            const SizedBox(height: 20),
            _sectionTitle('3. Financial Reports'),
            ...transactions.map((txn) => Card(
              child: ListTile(
                leading: const Icon(Icons.attach_money),
                title: Text('Amount: ${txn['amount']}'),
                subtitle: Text('Date: ${txn['date']}'),
                trailing: Text(txn['type']!),
              ),
            )),

            const SizedBox(height: 20),
            _sectionTitle('4. Summary Report'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Total Reservations: ${reservations.length}\n'
                  'Total Transactions: ${transactions.length}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue.shade800),
    );
  }
}