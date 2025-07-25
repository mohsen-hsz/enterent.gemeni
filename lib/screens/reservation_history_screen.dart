//File : reservation_history_screen.dart

import 'package:flutter/material.dart';

class ReservationHistoryScreen extends StatelessWidget {
  const ReservationHistoryScreen({super.key});

  // اطلاعات ساختگی برای تاریخچه رزروها
  final List<Map<String, dynamic>> _mockReservations = const [
    {
      'hotelName': 'Grand Hyatt Tehran',
      'image': 'assets/images/hotel1.jpg',
      'checkIn': '2024-05-10',
      'checkOut': '2024-05-15',
      'price': '1,250,000 Toman',
      'location': 'Tehran, Iran',
      'bookingId': 'H-123456',
    },
    {
      'hotelName': 'Shiraz Boutique Hotel',
      'image': 'assets/images/hotel2.jpg',
      'checkIn': '2023-11-20',
      'checkOut': '2023-11-22',
      'price': '700,000 Toman',
      'location': 'Shiraz, Iran',
      'bookingId': 'H-654321',
    },
    {
      'hotelName': 'Isfahan Traditional House',
      'image': 'assets/images/hotel3.jpg',
      'checkIn': '2023-08-01',
      'checkOut': '2023-08-05',
      'price': '950,000 Toman',
      'location': 'Isfahan, Iran',
      'bookingId': 'H-987654',
    },
    {
      'hotelName': 'Bali Beach Resort',
      'image': 'assets/images/bali.jpg',
      'checkIn': '2022-03-10',
      'checkOut': '2022-03-17',
      'price': '5,000,000 Toman',
      'location': 'Bali, Indonesia',
      'bookingId': 'H-112233',
    },
    {
      'hotelName': 'Dubai Luxury Suites',
      'image': 'assets/images/dubai.jpg',
      'checkIn': '2022-01-05',
      'checkOut': '2022-01-08',
      'price': '7,500,000 Toman',
      'location': 'Dubai, UAE',
      'bookingId': 'H-445566',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservation History', style: TextStyle(color: Colors.white)), // تاریخچه رزروها
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          // بخش خلاصه (Summary Section)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSummaryCard('Total Bookings', '5', Icons.book_online), // کل رزروها
                _buildSummaryCard('Total Nights', '18', Icons.nightlight_round), // کل شب‌ها
                _buildSummaryCard('Total Spent', '8.4M', Icons.attach_money), // کل هزینه
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1),
          // لیست تاریخچه رزروها (Reservation List)
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _mockReservations.length,
              itemBuilder: (context, index) {
                final reservation = _mockReservations[index];
                return _buildReservationCard(context, reservation);
              },
            ),
          ),
          // دکمه تماس با پشتیبانی (Contact Support Button)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // TODO: قابلیت تماس با پشتیبانی
                print('Contact Support button pressed'); // دکمه تماس با پشتیبانی فشرده شد
              },
              icon: const Icon(Icons.support_agent, color: Colors.white),
              label: const Text(
                'Contact Support', // تماس با پشتیبانی
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size(double.infinity, 50), // دکمه تمام عرض
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ویجت برای کارت‌های خلاصه (Summary Cards)
  Widget _buildSummaryCard(String title, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.blue.shade700),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  // ویجت برای کارت‌های رزرو (Reservation Cards)
  Widget _buildReservationCard(BuildContext context, Map<String, dynamic> reservation) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    reservation['image'],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reservation['hotelName'],
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        reservation['location'],
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Check-in: ${reservation['checkIn']}', // تاریخ ورود
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Check-out: ${reservation['checkOut']}', // تاریخ خروج
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      reservation['price'],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green.shade700),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Booking ID: ${reservation['bookingId']}', // شناسه رزرو
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // TODO: قابلیت مشاهده جزئیات بیشتر رزرو
                      print('View Details for ${reservation['hotelName']}'); // مشاهده جزئیات
                    },
                    icon: const Icon(Icons.info_outline),
                    label: const Text('View Details'), // مشاهده جزئیات
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blue.shade700,
                      side: BorderSide(color: Colors.blue.shade700),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: قابلیت رزرو مجدد این هتل
                      print('Re-book ${reservation['hotelName']}'); // رزرو مجدد
                    },
                    icon: const Icon(Icons.refresh, color: Colors.white),
                    label: const Text('Re-book', style: TextStyle(color: Colors.white)), // رزرو مجدد
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
