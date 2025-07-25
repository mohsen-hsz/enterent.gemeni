// File: lib/screens/cities_page.dart
import 'package:flutter/material.dart';
import 'package:hotel_reservation_app/models/province.dart';
import 'package:hotel_reservation_app/models/city.dart';
import 'package:hotel_reservation_app/services/api_service.dart';

class CitiesPage extends StatelessWidget {
  final Province province;

  const CitiesPage({super.key, required this.province});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cities of ${province.name}', style: const TextStyle(color: Colors.white)), // شهرهای [نام استان]
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<City>>(
        future: ApiService.getCities(province.id).then((data) => data.map((e) => City.fromJson(e)).toList()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // خطا در دریافت لیست شهرها
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No cities found for this province.')); // شهری برای این استان یافت نشد.
          } else {
            final cities = snapshot.data!;
            return ListView.builder(
              itemCount: cities.length,
              itemBuilder: (context, index) {
                final city = cities[index];
                return ListTile(
                  title: Text(city.name),
                  onTap: () {
                    // بازگرداندن اطلاعات شهر و استان به صفحه قبلی
                    Navigator.pop(context, {
                      'province_id': province.id,
                      'province_name': province.name,
                      'city_id': city.id,
                      'city_name': city.name,
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
