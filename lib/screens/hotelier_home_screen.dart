// File: screens/hotelier_home_screen.dart
import 'package:flutter/material.dart';
import 'package:hotel_reservation_app/screens/add_hotel_listing_screen.dart';
import 'package:hotel_reservation_app/screens/detail_page.dart';
import 'package:hotel_reservation_app/screens/hotelier_profile_screen.dart';
import 'package:hotel_reservation_app/screens/provider_requests_screen.dart';
import 'package:hotel_reservation_app/screens/provider_status_screen.dart';
import 'package:hotel_reservation_app/screens/provider_revenue_screen.dart';
import 'package:hotel_reservation_app/screens/provider_service_history_screen.dart';
import 'package:hotel_reservation_app/screens/provider_ratings_feedback_screen.dart';
import 'package:hotel_reservation_app/screens/provider_chat_screen.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import جدید
import 'dart:convert'; // برای تبدیل به JSON
import 'package:hotel_reservation_app/services/api_service.dart'; // Import ApiService
import 'package:hotel_reservation_app/screens/home_content.dart'; // Import HomeContent برای دسترسی به State آن

class HotelierHomeScreen extends StatefulWidget {
  const HotelierHomeScreen({super.key});

  @override
  State<HotelierHomeScreen> createState() => _HotelierHomeScreenState();
}

class _HotelierHomeScreenState extends State<HotelierHomeScreen> {
  // لیست هتل‌های اضافه شده توسط این هتل‌دار
  List<Map<String, dynamic>> _myHotels = [];
  bool _isLoading = true; // برای نمایش وضعیت بارگذاری

  @override
  void initState() {
    super.initState();
    _loadAndFetchMyHotels(); // بارگذاری و دریافت هتل‌های هتل‌دار هنگام شروع
  }

  // تابع برای بارگذاری هتل‌های هتل‌دار از SharedPreferences و سپس دریافت از API
  Future<void> _loadAndFetchMyHotels() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? myHotelsString = prefs.getString('my_listed_hotels');

      if (myHotelsString != null) {
        _myHotels = (jsonDecode(myHotelsString) as List)
            .map((item) => item as Map<String, dynamic>)
            .toList();
      }

      // دریافت هتل‌ها از API
      final apiHotels = await ApiService.getAccommodations();
      // فرض می‌کنیم owner_id کاربر فعلی را داریم (مثلاً از توکن یا پس از ورود)
      final int? currentOwnerId = await ApiService.getUserId(); // دریافت user_id کاربر لاگین شده

      _myHotels.clear(); // لیست محلی را پاک می‌کنیم تا با داده‌های API به‌روز شود
      if (currentOwnerId != null) {
        for (var apiHotel in apiHotels) {
          // فیلتر کردن هتل‌ها بر اساس owner_id
          if (apiHotel['owner_id'] == currentOwnerId) {
            _myHotels.add({
              'hotelName': apiHotel['name'],
              'image': 'assets/images/hotel_placeholder.jpg', // API تصویر مستقیم نمی‌دهد
              'rating': 'N/A',
              'price': '${apiHotel['price_per_day'] ?? 'N/A'} Toman',
              'location': 'Province ${apiHotel['province_id'] ?? ''}, City ${apiHotel['city_id'] ?? ''}',
              'description': apiHotel['address'] ?? 'No description provided.',
              'amenities': {'wifi': false, 'pool': false, 'parking': false, 'restaurant': false, 'tv': false, 'kitchen': false, 'bathroom': false},
            });
          }
        }
      }
      await _saveMyHotels(); // لیست به‌روز شده را ذخیره می‌کنیم
    } catch (e) {
      print('Error loading or fetching my hotels: $e'); // خطا در بارگذاری یا دریافت هتل‌ها
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load your hotels: $e')), // خطا در بارگذاری هتل‌های شما
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // تابع برای ذخیره هتل‌های هتل‌دار در SharedPreferences
  Future<void> _saveMyHotels() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('my_listed_hotels', jsonEncode(_myHotels));
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator()); // نمایش لودینگ
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Hotels (Hotelier Panel)', style: TextStyle(color: Colors.white)), // هتل‌های من (پنل هتل‌دار)
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.person), // آیکون پروفایل
            onPressed: () {
              Navigator.pushNamed(context, '/hotelier_profile'); // هدایت به صفحه پروفایل هتل‌دار
              print('Navigate to Hotelier Profile');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: Image.asset('assets/images/boy.jpg').image, // تصویر پروفایل کاربر
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Hello, Hotelier!', // سلام، هتل‌دار!
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.hotel, color: Colors.blue),
              title: const Text('My Listed Hotels'), // هتل‌های لیست شده من
              onTap: () {
                Navigator.pop(context); // بستن Drawer
                // در حال حاضر در همین صفحه هستیم، نیازی به ناوبری نیست
              },
            ),
            ListTile(
              leading: const Icon(Icons.receipt_long, color: Colors.blue),
              title: const Text('Incoming Requests'), // درخواست‌های ورودی
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/provider_requests');
              },
            ),
            ListTile(
              leading: const Icon(Icons.online_prediction, color: Colors.blue),
              title: const Text('Change Status'), // تغییر وضعیت
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/provider_status');
              },
            ),
            ListTile(
              leading: const Icon(Icons.attach_money, color: Colors.blue),
              title: const Text('My Revenue'), // درآمد من
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/provider_revenue');
              },
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Colors.blue),
              title: const Text('Service History'), // تاریخچه سرویس
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/provider_service_history');
              },
            ),
            ListTile(
              leading: const Icon(Icons.star, color: Colors.blue),
              title: const Text('Ratings & Feedback'), // امتیازات و بازخورد
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/provider_ratings_feedback');
              },
            ),
            ListTile(
              leading: const Icon(Icons.chat, color: Colors.blue),
              title: const Text('Chat with Users'), // چت با کاربران
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/provider_chat');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.admin_panel_settings, color: Colors.blue),
              title: const Text('Management Panel'), // پنل مدیریت
              onTap: () {
                Navigator.pushNamed(context, '/management_panel'); // مسیر جدید برای پنل مدیریت مشترک
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout'), // خروج
              onTap: () {
                ApiService.deleteTokenAndUserId(); // حذف توکن و User ID هنگام خروج
                Navigator.pushReplacementNamed(context, '/'); // بازگشت به صفحه ورود
              },
            ),
          ],
        ),
      ),
      body: _myHotels.isEmpty && !_isLoading
          ? const Center(
        child: Text(
          'You have not listed any hotels yet.\nTap the + button to add a new hotel!', // شما هنوز هتلی لیست نکرده‌اید. دکمه + را برای افزودن هتل جدید لمس کنید!
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _myHotels.length,
        itemBuilder: (context, index) {
          final hotel = _myHotels[index];
          return _buildHotelCard(context, hotel); // ساخت کارت هتل
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print('Add new hotel listing FAB pressed from Hotelier Home'); // برای دیباگ
          final newHotel = await Navigator.pushNamed(context, '/add_hotel_listing');
          if (newHotel != null && newHotel is Map<String, dynamic>) {
            // پس از اضافه شدن هتل جدید، لیست را دوباره بارگذاری می‌کنیم تا از API به‌روز شود
            _loadAndFetchMyHotels();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('New hotel added: ${newHotel['hotelName']}')), // هتل جدید اضافه شد:
            );
          }
        },
        backgroundColor: Colors.grey.shade700, // رنگ خاکستری
        foregroundColor: Colors.white,
        shape: const CircleBorder(), // دایره‌ای کردن دکمه
        child: const Icon(Icons.add, size: 36), // آیکون + بزرگ
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked, // قرار دادن دکمه در سمت چپ پایین
    );
  }

  // ویجت برای ساخت کارت هتل (مشابه HomeContent)
  Widget _buildHotelCard(BuildContext context, Map<String, dynamic> hotelData) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/detail_page',
          arguments: hotelData, // ارسال کل اطلاعات هتل
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 16.0),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  hotelData['image'],
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) { // اضافه کردن errorBuilder برای تصاویر نامعتبر
                    return Image.asset(
                      'assets/images/hotel_placeholder.jpg', // تصویر پیش‌فرض در صورت خطا
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hotelData['hotelName'],
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      hotelData['location'],
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber.shade700, size: 18),
                        Text(hotelData['rating']),
                        const SizedBox(width: 10),
                        Text(
                          hotelData['price'],
                          style: TextStyle(
                            color: Colors.blue.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      hotelData['description'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
