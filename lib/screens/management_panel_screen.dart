// File: screens/management_panel_screen.dart
import 'package:flutter/material.dart';
import 'package:hotel_reservation_app/screens/user_detail_screen.dart';
import 'package:hotel_reservation_app/services/api_service.dart'; // Import ApiService

class ManagementPanelScreen extends StatefulWidget {
  const ManagementPanelScreen({super.key});

  @override
  State<ManagementPanelScreen> createState() => _ManagementPanelScreenState();
}

class _ManagementPanelScreenState extends State<ManagementPanelScreen> {
  List<Map<String, dynamic>> _users = []; // لیست کاربران
  bool _isLoading = true; // برای نمایش وضعیت بارگذاری

  @override
  void initState() {
    super.initState();
    _fetchUsers(); // دریافت کاربران هنگام شروع
  }

  // تابع برای دریافت کاربران از API
  Future<void> _fetchUsers() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final apiUsers = await ApiService.getUsers();
      setState(() {
        _users = apiUsers.map((user) => {
          'id': user['id'].toString(), // ID را به String تبدیل می‌کنیم
          'name': '${user['first_name'] ?? ''} ${user['last_name'] ?? ''}'.trim(),
          'role': user['is_owner'] == 1 ? 'Hotelier' : 'Traveler', // فرض می‌کنیم is_owner نقش را مشخص می‌کند
          'status': 'Active', // API وضعیت را نمی‌دهد، پیش‌فرض Active
        }).toList();
      });
    } catch (e) {
      print('Error fetching users: $e'); // خطا در دریافت کاربران
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load users: $e')), // خطا در بارگذاری کاربران
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _toggleUserStatus(String userId, String currentStatus) {
    // TODO: پیاده‌سازی API برای تغییر وضعیت کاربر
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
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => UserDetailScreen(user: user),
                        ),
                      );
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
