// File: screens/management_panel_screen.dart
import 'package:flutter/material.dart';

class ManagementPanelScreen extends StatefulWidget {
  const ManagementPanelScreen({super.key});

  @override
  State<ManagementPanelScreen> createState() => _ManagementPanelScreenState();
}

class _ManagementPanelScreenState extends State<ManagementPanelScreen> {
  // اطلاعات ساختگی کاربران
  final List<Map<String, dynamic>> _users = [
    {'id': 'T001', 'name': 'Ali Ahmadi', 'role': 'Traveler', 'status': 'Active'},
    {'id': 'H001', 'name': 'Mohsen Hosseini', 'role': 'Hotelier', 'status': 'Active'},
    {'id': 'T002', 'name': 'Sara Karimi', 'role': 'Traveler', 'status': 'Active'},
    {'id': 'H002', 'name': 'Reza Nazari', 'role': 'Hotelier', 'status': 'Inactive'},
    {'id': 'T003', 'name': 'Narges Abbasi', 'role': 'Traveler', 'status': 'Blocked'},
  ];

  void _toggleUserStatus(String userId, String currentStatus) {
    setState(() {
      final index = _users.indexWhere((user) => user['id'] == userId);
      if (index != -1) {
        _users[index]['status'] = currentStatus == 'Active' ? 'Blocked' : 'Active';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User $userId status changed to ${_users[index]['status']}!')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Management Panel', style: TextStyle(color: Colors.white)), // پنل مدیریت
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'User Management', // مدیریت کاربران
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue.shade800),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: _users.length,
              itemBuilder: (context, index) {
                final user = _users[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12.0),
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: user['role'] == 'Traveler' ? Colors.blue.shade100 : Colors.orange.shade100,
                      child: Icon(
                        user['role'] == 'Traveler' ? Icons.person : Icons.hotel,
                        color: user['role'] == 'Traveler' ? Colors.blue.shade700 : Colors.orange.shade700,
                      ),
                    ),
                    title: Text(
                      user['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Role: ${user['role']} | ID: ${user['id']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          user['status'],
                          style: TextStyle(
                            color: user['status'] == 'Active' ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: Icon(
                            user['status'] == 'Active' ? Icons.block : Icons.check_circle_outline,
                            color: user['status'] == 'Active' ? Colors.red : Colors.green,
                          ),
                          onPressed: () => _toggleUserStatus(user['id'], user['status']),
                        ),
                      ],
                    ),
                    onTap: () {
                      print('User ${user['name']} tapped');
                      // TODO: قابلیت مشاهده جزئیات بیشتر کاربر
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
