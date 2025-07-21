// File: screens/provider_revenue_screen.dart
import 'package:flutter/material.dart';

class ProviderRevenueScreen extends StatelessWidget {
  const ProviderRevenueScreen({super.key});

  // اطلاعات ساختگی درآمد
  final Map<String, dynamic> _revenueData = const {
    'dailyRevenue': '500,000 Toman',
    'monthlyRevenue': '15,000,000 Toman',
    'platformCommission': '1,500,000 Toman',
    'netAmount': '13,500,000 Toman',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Revenue', style: TextStyle(color: Colors.white)), // درآمد من
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Revenue Report', // گزارش درآمد
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            _buildRevenueCard('Daily Revenue', _revenueData['dailyRevenue']!, Icons.today), // درآمد روزانه
            _buildRevenueCard('Monthly Revenue', _revenueData['monthlyRevenue']!, Icons.calendar_month), // درآمد ماهانه
            const Divider(height: 30, thickness: 1),
            _buildRevenueCard('Platform Commission', _revenueData['platformCommission']!, Icons.percent), // کمیسیون پلتفرم
            _buildRevenueCard('Net Amount', _revenueData['netAmount']!, Icons.wallet_giftcard, isNetAmount: true), // مبلغ خالص
          ],
        ),
      ),
    );
  }

  Widget _buildRevenueCard(String title, String value, IconData icon, {bool isNetAmount = false}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 30, color: isNetAmount ? Colors.green.shade700 : Colors.blue.shade700),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isNetAmount ? Colors.green.shade700 : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
