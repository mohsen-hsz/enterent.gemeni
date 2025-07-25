// File: lib/screens/provinces_page.dart
import 'package:flutter/material.dart';
import 'package:hotel_reservation_app/services/api_service.dart';
import 'package:hotel_reservation_app/models/province.dart';
import 'package:hotel_reservation_app/screens/cities_page.dart';

class ProvincesPage extends StatelessWidget {
  const ProvincesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Province', style: TextStyle(color: Colors.white)), // انتخاب استان
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<Province>>(
        // تغییر از fetchProvinces به getProvinces
        future: ApiService.getProvinces().then((data) => data.map((e) => Province.fromJson(e)).toList()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // خطا در دریافت لیست استان‌ها
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No provinces found.')); // استانی یافت نشد.
          } else {
            final provinces = snapshot.data!;
            return ListView.builder(
              itemCount: provinces.length,
              itemBuilder: (context, index) {
                final province = provinces[index];
                return ListTile(
                  title: Text(province.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CitiesPage(province: province),
                      ),
                    ).then((selectedCity) {
                      // وقتی از CitiesPage برگشتیم، اگر شهری انتخاب شده بود، آن را به صفحه قبلی برمی‌گردانیم
                      if (selectedCity != null && selectedCity is Map<String, dynamic>) {
                        Navigator.pop(context, selectedCity);
                      }
                    });
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
