// File: screens/provider_ratings_feedback_screen.dart
import 'package:flutter/material.dart';

class ProviderRatingsFeedbackScreen extends StatelessWidget {
  const ProviderRatingsFeedbackScreen({super.key});

  // اطلاعات ساختگی امتیازات و نظرات
  final List<Map<String, dynamic>> _mockFeedback = const [
    {
      'userName': 'Saeed Karimi',
      'rating': 5,
      'comment': 'Excellent service, very clean hotel and friendly staff. Highly recommended!', // خدمات عالی، هتل بسیار تمیز و کارکنان دوستانه. بسیار توصیه می‌شود!
      'date': '2024-05-16',
    },
    {
      'userName': 'Leila Abbasi',
      'rating': 4,
      'comment': 'Good experience overall, but the breakfast could be improved.', // تجربه کلی خوب بود، اما صبحانه می‌توانست بهتر باشد.
      'date': '2024-04-25',
    },
    {
      'userName': 'Majid Hosseini',
      'rating': 5,
      'comment': 'Fantastic stay! The room was spacious and comfortable.', // اقامت فوق‌العاده! اتاق بزرگ و راحت بود.
      'date': '2023-12-01',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ratings & Feedback', style: TextStyle(color: Colors.white)), // امتیازات و بازخورد
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _mockFeedback.isEmpty
          ? const Center(
        child: Text(
          'No feedback available yet.', // هنوز بازخوردی در دسترس نیست.
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _mockFeedback.length,
        itemBuilder: (context, index) {
          final feedback = _mockFeedback[index];
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        feedback['userName'], // نام کاربر
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: List.generate(5, (starIndex) {
                          return Icon(
                            starIndex < feedback['rating'] ? Icons.star : Icons.star_border,
                            color: Colors.amber,
                            size: 20,
                          );
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    feedback['comment'], // نظر
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Date: ${feedback['date']}', // تاریخ
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
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
