// File: screens/home_content.dart
// This class contains the main content of the Home page for Travelers
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import جدید
import 'dart:convert'; // برای تبدیل به JSON
import 'package:hotel_reservation_app/services/api_service.dart'; // Import ApiService

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => HomeContentState(); // نام کلاس State به HomeContentState تغییر یافت
}

class HomeContentState extends State<HomeContent> { // نام کلاس State به HomeContentState تغییر یافت
  // اطلاعات ساختگی برای هتل‌ها (اینها هتل‌های عمومی هستند که همه می‌بینند)
  List<Map<String, dynamic>> _hotels = [];
  bool _isLoading = true; // برای نمایش وضعیت بارگذاری

  // لیست هتل‌های پیش‌فرض (ویترین)
  final List<Map<String, dynamic>> _defaultHotels = const [
    {
      'hotelName': 'Grand Hyatt Tehran', // نام هتل
      'image': 'assets/images/hotel1.jpg', // تصویر
      'rating': '4.8', // امتیاز
      'price': 'From 2,500,000 Toman', // قیمت
      'location': 'Tehran, Iran', // مکان
      'description': 'Experience luxury and comfort at Grand Hyatt Tehran, offering exquisite dining and stunning city views.', // توضیحات
      'amenities': {
        'wifi': true, 'pool': true, 'parking': true, 'restaurant': true, 'tv': true, 'kitchen': false, 'bathroom': true,
      },
    },
    {
      'hotelName': 'Shiraz Garden Hotel', // نام هتل
      'image': 'assets/images/hotel2.jpg', // تصویر
      'rating': '4.6', // امتیاز
      'price': 'From 1,800,000 Toman', // قیمت
      'location': 'Shiraz, Iran', // مکان
      'description': 'A charming hotel nestled in the heart of Shiraz, close to historical gardens and cultural sites.', // توضیحات
      'amenities': {
        'wifi': true, 'pool': false, 'parking': true, 'restaurant': true, 'tv': true, 'kitchen': false, 'bathroom': true,
      },
    },
    {
      'hotelName': 'Isfahan Traditional Suites', // نام هتل
      'image': 'assets/images/hotel3.jpg', // تصویر
      'rating': '4.7', // امتیاز
      'price': 'From 2,000,000 Toman', // قیمت
      'location': 'Isfahan, Iran', // مکان
      'description': 'Immerse yourself in the rich history of Isfahan with a stay in these beautifully restored traditional suites.', // توضیحات
      'amenities': {
        'wifi': true, 'pool': true, 'parking': true, 'restaurant': false, 'tv': true, 'kitchen': true, 'bathroom': true,
      },
    },
  ];

  @override
  void initState() {
    super.initState();
    _loadHotels(); // بارگذاری هتل‌ها هنگام شروع
  }

  // تابع برای بارگذاری هتل‌ها از SharedPreferences و سپس دریافت از API
  Future<void> _loadHotels() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? hotelsString = prefs.getString('all_hotels');

      if (hotelsString != null) {
        // اگر هتل‌ها قبلاً در SharedPreferences ذخیره شده بودند، آن‌ها را بارگذاری می‌کنیم
        _hotels = (jsonDecode(hotelsString) as List)
            .map((item) => item as Map<String, dynamic>)
            .toList();
      } else {
        // اگر هیچ هتلی در SharedPreferences نبود، هتل‌های پیش‌فرض (ویترین) را اضافه می‌کنیم
        _hotels = List.from(_defaultHotels);
        await _saveHotels(); // هتل‌های پیش‌فرض را ذخیره می‌کنیم
      }

      // سپس تلاش می‌کنیم هتل‌ها را از API دریافت کنیم
      final apiHotels = await ApiService.getAccommodations();
      // برای این مثال، هتل‌های API را به لیست موجود اضافه می‌کنیم.
      // در یک سناریوی واقعی، باید منطق همگام‌سازی پیچیده‌تری داشته باشید.
      for (var apiHotel in apiHotels) {
        // جلوگیری از اضافه شدن تکراری هتل‌ها
        if (!_hotels.any((hotel) => hotel['hotelName'] == apiHotel['name'])) {
          _hotels.add({
            'hotelName': apiHotel['name'],
            'image': 'assets/images/hotel_placeholder.jpg', // API تصویر مستقیم نمی‌دهد، از Placeholder استفاده می‌کنیم
            'rating': 'N/A', // API امتیاز نمی‌دهد
            'price': '${apiHotel['price_per_day'] ?? 'N/A'} Toman',
            'location': 'Province ${apiHotel['province_id'] ?? ''}, City ${apiHotel['city_id'] ?? ''}', // از ID استان و شهر استفاده می‌کنیم
            'description': apiHotel['address'] ?? 'No description provided.', // آدرس را به عنوان توضیحات موقت
            'amenities': {'wifi': false, 'pool': false, 'parking': false, 'restaurant': false, 'tv': false, 'kitchen': false, 'bathroom': false}, // API امکانات نمی‌دهد
          });
        }
      }
      await _saveHotels(); // لیست به‌روز شده را ذخیره می‌کنیم
    } catch (e) {
      print('Error loading or fetching hotels: $e'); // خطا در بارگذاری یا دریافت هتل‌ها
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load hotels: $e')), // خطا در بارگذاری هتل‌ها
      );
      // اگر خطا رخ داد و لیست خالی بود، هتل‌های پیش‌فرض را نمایش می‌دهیم
      if (_hotels.isEmpty) {
        _hotels = List.from(_defaultHotels);
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // تابع برای ذخیره هتل‌ها در SharedPreferences
  Future<void> _saveHotels() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('all_hotels', jsonEncode(_hotels));
  }

  // متدی برای اضافه کردن هتل جدید به لیست (فراخوانی شده از HotelierHomeScreen)
  void addHotel(Map<String, dynamic> newHotel) {
    setState(() {
      _hotels.add(newHotel);
    });
    _saveHotels(); // ذخیره لیست به‌روز شده
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator()); // نمایش لودینگ
    }

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
                errorBuilder: (context, error, stackTrace) { // اضافه کردن errorBuilder برای تصاویر نامعتبر
                  return Image.asset(
                    'assets/images/hotel_placeholder.jpg', // تصویر پیش‌فرض در صورت خطا
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                },
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
