// File: screens/provider_requests_screen.dart
import 'package:flutter/material.dart';

class ProviderRequestsScreen extends StatefulWidget {
  const ProviderRequestsScreen({super.key});

  @override
  State<ProviderRequestsScreen> createState() => _ProviderRequestsScreenState();
}

class _ProviderRequestsScreenState extends State<ProviderRequestsScreen> {
  // اطلاعات ساختگی برای درخواست‌های رزرو
  final List<Map<String, dynamic>> _requests = [
    {
      'id': 'REQ001',
      'userName': 'Ahmad Karimi',
      'hotelName': 'Grand Hyatt Tehran',
      'checkIn': '2025-08-01',
      'checkOut': '2025-08-05',
      'guests': 2,
      'status': 'Pending',
    },
    {
      'id': 'REQ002',
      'userName': 'Sara Mohammadi',
      'hotelName': 'Shiraz Boutique Hotel',
      'checkIn': '2025-08-10',
      'checkOut': '2025-08-12',
      'guests': 1,
      'status': 'Pending',
    },
    {
      'id': 'REQ003',
      'userName': 'Reza Nazari',
      'hotelName': 'Isfahan Traditional House',
      'checkIn': '2025-07-25',
      'checkOut': '2025-07-28',
      'guests': 3,
      'status': 'Accepted',
    },
  ];

  void _updateRequestStatus(String requestId, String newStatus) {
    setState(() {
      final index = _requests.indexWhere((req) => req['id'] == requestId);
      if (index != -1) {
        _requests[index]['status'] = newStatus;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Request $requestId $newStatus!')), // درخواست $requestId $newStatus شد!
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Incoming Requests', style: TextStyle(color: Colors.white)), // درخواست‌های ورودی
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _requests.isEmpty
          ? const Center(
        child: Text(
          'No new requests at the moment.', // در حال حاضر درخواست جدیدی وجود ندارد.
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _requests.length,
        itemBuilder: (context, index) {
          final request = _requests[index];
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
                    'Request ID: ${request['id']}', // شناسه درخواست:
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'User: ${request['userName']}', // کاربر:
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Hotel: ${request['hotelName']}', // هتل:
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 8),
                  Text('Check-in: ${request['checkIn']}'), // تاریخ ورود:
                  Text('Check-out: ${request['checkOut']}'), // تاریخ خروج:
                  Text('Guests: ${request['guests']}'), // مهمانان:
                  const SizedBox(height: 12),
                  Text(
                    'Status: ${request['status']}', // وضعیت:
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: request['status'] == 'Pending'
                          ? Colors.orange
                          : (request['status'] == 'Accepted' ? Colors.green : Colors.red),
                    ),
                  ),
                  if (request['status'] == 'Pending') ...[
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => _updateRequestStatus(request['id'], 'Accepted'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            child: const Text('Accept'), // پذیرش
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => _updateRequestStatus(request['id'], 'Rejected'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.red,
                              side: const BorderSide(color: Colors.red),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            child: const Text('Reject'), // رد
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
