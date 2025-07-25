// File: lib/models/city.dart
class City {
  final int id;
  final String name;

  City({required this.id, required this.name});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      // تلاش برای تبدیل id به int، اگر String بود parse می‌کند
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0, // اگر null یا نامعتبر بود، 0
      name: json['name'] ?? '',
    );
  }
}
