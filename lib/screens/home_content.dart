// File: screens/home_content.dart
// This class contains the main content of the Home page
import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => HomeContentState();
}

class HomeContentState extends State<HomeContent> {
  // اطلاعات ساختگی برای هتل‌ها
  List<Map<String, dynamic>> _hotels = [
    {
      'hotelName': 'Hotel Tehran',
      'image': 'assets/images/hotel1.jpg',
      'rating': '4.5',
      'price': '250 Toman',
      'location': 'Tehran, Iran',
      'description': 'A luxurious hotel in the heart of Tehran with modern amenities.', // توضیحات اضافه شد
      'amenities': {
        'wifi': true,
        'pool': true,
        'parking': false,
        'restaurant': true,
        'tv': true, // اضافه شد
        'kitchen': true, // اضافه شد
        'bathroom': true, // اضافه شد
      },
    },
    {
      'hotelName': 'Hotel Shiraz',
      'image': 'assets/images/hotel2.jpg',
      'rating': '4.5',
      'price': '250 Toman',
      'location': 'Shiraz, Iran',
      'description': 'Experience the rich culture of Shiraz in this traditional yet comfortable hotel.', // توضیحات اضافه شد
      'amenities': {
        'wifi': true,
        'pool': false,
        'parking': true,
        'restaurant': true,
        'tv': true, // اضافه شد
        'kitchen': false, // اضافه شد
        'bathroom': true, // اضافه شد
      },
    },
    {
      'hotelName': 'Hotel Esfahan',
      'image': 'assets/images/hotel3.jpg',
      'rating': '4.5',
      'price': '250 Toman',
      'location': 'Isfahan, Iran',
      'description': 'A beautiful hotel near historical sites, offering a blend of tradition and comfort.', // توضیحات اضافه شد
      'amenities': {
        'wifi': true,
        'pool': true,
        'parking': true,
        'restaurant': false,
        'tv': true, // اضافه شد
        'kitchen': true, // اضافه شد
        'bathroom': true, // اضافه شد
      },
    },
  ];

  // متدی برای اضافه کردن هتل جدید به لیست
  void addHotel(Map<String, dynamic> newHotel) {
    setState(() {
      _hotels.add(newHotel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Image
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset('assets/images/home.jpg').image, // Home image
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.6),
                  ],
                ),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: const Text(
                'Welcome to Hotel Reservation App!', // به اپلیکیشن رزرو هتل خوش آمدید!
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Hotels', // هتل‌ها
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: _hotels.length,
              itemBuilder: (context, index) {
                final hotel = _hotels[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: _buildHotelCard(context, hotel), // ارسال کل Map هتل
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Popular Destinations', // مقصد‌های محبوب
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                _buildDestinationCard('Bali', 'assets/images/bali.jpg'), // Bali
                const SizedBox(width: 15),
                _buildDestinationCard('Dubai', 'assets/images/dubai.jpg'), // Dubai
                const SizedBox(width: 15),
                _buildDestinationCard('Mumbai', 'assets/images/mumbai.jpg'), // Mumbai
                const SizedBox(width: 15),
                _buildDestinationCard('New York', 'assets/images/newyork.jpg'), // New York
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // تغییر پارامتر به Map<String, dynamic> hotelData
  Widget _buildHotelCard(BuildContext context, Map<String, dynamic> hotelData) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/detail_page',
          arguments: hotelData, // ارسال کل اطلاعات هتل
        );
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                hotelData['image'], // استفاده از image از hotelData
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                hotelData['hotelName'], // استفاده از hotelName از hotelData
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.amber.shade700, size: 18),
                  Text(hotelData['rating']), // استفاده از rating از hotelData
                  const Spacer(),
                  Text(
                    hotelData['price'], // استفاده از price از hotelData
                    style: TextStyle(
                      color: Colors.blue.shade700,
                      fontWeight: FontWeight.bold,
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

  Widget _buildDestinationCard(String title, String imagePath) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
