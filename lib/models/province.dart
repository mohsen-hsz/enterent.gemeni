// File: lib/models/province.dart
class Province {
  final int id;
  final String name;

  Province({required this.id, required this.name});

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      // تلاش برای تبدیل id به int، اگر String بود parse می‌کند
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0, // اگر null یا نامعتبر بود، 0
      name: json['name'] ?? '',
    );
  }
}
