// File: screens/detail_page.dart

import 'package:flutter/material.dart';
import 'package:hotel_reservation_app/screens/support2.dart'; // برای Appwidget

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // متغیرها برای نگهداری اطلاعات هتل
  String hotelName = "Hotel Name";
  String imagePath = 'assets/images/hotel_placeholder.jpg'; // تصویر پیش‌فرض
  String price = "0 Toman";
  String location = "Unknown Location";
  String description = "No description available.";
  Map<String, bool> amenities = {
    'wifi': false,
    'pool': false,
    'parking': false,
    'restaurant': false,
    'tv': false, // اضافه شد
    'kitchen': false, // اضافه شد
    'bathroom': false, // اضافه شد
  };

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // دریافت اطلاعات هتل از arguments
    final Map<String, dynamic>? args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args != null) {
      setState(() {
        hotelName = args['hotelName'] ?? "Hotel Name";
        imagePath = args['image'] ?? 'assets/images/hotel_placeholder.jpg';
        price = args['price'] ?? "0 Toman";
        location = args['location'] ?? "Unknown Location";
        description = args['description'] ?? "No description available.";
        // اطمینان از اینکه amenities به درستی cast و مقداردهی اولیه می‌شود
        final receivedAmenities = (args['amenities'] as Map<String, dynamic>?)?.cast<String, bool>();
        if (receivedAmenities != null) {
          amenities = {
            'wifi': receivedAmenities['wifi'] ?? false,
            'pool': receivedAmenities['pool'] ?? false,
            'parking': receivedAmenities['parking'] ?? false,
            'restaurant': receivedAmenities['restaurant'] ?? false,
            'tv': receivedAmenities['tv'] ?? false,
            'kitchen': receivedAmenities['kitchen'] ?? false,
            'bathroom': receivedAmenities['bathroom'] ?? false,
          };
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    child: Image.asset(
                      imagePath, // استفاده از تصویر هتل
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(top: 50.0, left: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  Text(hotelName, style: Appwidget.headlinetextstyle(28.0)), // نام هتل
                  Text(price, style: Appwidget.normaltextstyle(28.0)), // قیمت
                  const Divider(thickness: 2.0),
                  const SizedBox(height: 10.0),
                  Text(
                    "What this place offers", // این مکان چه امکاناتی دارد
                    style: Appwidget.headlinetextstyle(22.0),
                  ),
                  const SizedBox(height: 5.0),
                  // نمایش امکانات بر اساس داده‌های دریافتی و فقط اگر true باشند
                  if (amenities['wifi'] == true) _buildAmenityRow(Icons.wifi, "Wi-Fi"),
                  if (amenities['pool'] == true) _buildAmenityRow(Icons.pool, "Swimming Pool"),
                  if (amenities['parking'] == true) _buildAmenityRow(Icons.local_parking, "Parking"),
                  if (amenities['restaurant'] == true) _buildAmenityRow(Icons.restaurant, "Restaurant"),
                  if (amenities['tv'] == true) _buildAmenityRow(Icons.tv, "TV"), // شرطی شد
                  if (amenities['kitchen'] == true) _buildAmenityRow(Icons.kitchen, "Kitchen"), // شرطی شد
                  if (amenities['bathroom'] == true) _buildAmenityRow(Icons.bathroom, "Bathroom"), // شرطی شد
                  const Divider(thickness: 2.0),
                  const SizedBox(height: 5.0),
                  Text(
                    "About this place", // درباره این مکان
                    style: Appwidget.headlinetextstyle(22.0),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    description, // توضیحات هتل
                    style: Appwidget.normaltextstyle(18.0),
                  ),
                  const SizedBox(height: 20.0),
                  Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10.0),
                          Text(
                            "\$100 for 4 nights", // این بخش را می‌توانید پویا کنید
                            style: Appwidget.headlinetextstyle(20.0),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            "Check-in Date", // تاریخ ورود
                            style: Appwidget.headlinetextstyle(20.0),
                          ),
                          const Divider(),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Text(
                                "02, Apr 2025", // این بخش را می‌توانید پویا کنید
                                style: Appwidget.normaltextstyle(20.0),
                              ),
                            ],
                          ),

                          const SizedBox(height: 5.0),
                          Text(
                            "Check-out Date", // تاریخ خروج
                            style: Appwidget.headlinetextstyle(20.0),
                          ),
                          const Divider(),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Text(
                                "05, Apr 2025", // این بخش را می‌توانید پویا کنید
                                style: Appwidget.normaltextstyle(20.0),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            "Number of Guests", // تعداد مهمانان
                            style: Appwidget.normaltextstyle(20.0),
                          ),
                          const SizedBox(height: 5.0),
                          Container(
                            padding: const EdgeInsets.only(left: 20.0),
                            decoration: BoxDecoration(color: const Color.fromARGB(255, 243, 243, 243), borderRadius: BorderRadius.circular(10)),
                            child: const TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "1",
                                  hintStyle: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w500)
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0,),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                            child: Center(child: Text("Book Now", style: Appwidget.whitetextstyle(22.0),)), // رزرو کن
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ویجت کمکی برای نمایش یک امکانات
  Widget _buildAmenityRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 30.0),
          const SizedBox(width: 10.0),
          Text(text, style: Appwidget.normaltextstyle(23.0)),
        ],
      ),
    );
  }
}
