// File: lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  // Base URL برای API شما
  static const String _baseUrl = 'https://jagir.liara.run/api';

  // متد برای ثبت‌نام کاربر
  static Future<Map<String, dynamic>> registerUser(String firstName, String lastName, String phone, String password) async {
    final url = Uri.parse('$_baseUrl/auth/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'first_name': firstName,
        'last_name': lastName,
        'phone': phone,
        'password': password,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to register user: ${response.body}');
    }
  }

  // متد برای ورود کاربر (با شماره موبایل و رمز عبور)
  static Future<Map<String, dynamic>> loginUser(String phone, String password) async {
    final url = Uri.parse('$_baseUrl/auth/login'); // فرض می‌کنیم این Endpoint وجود دارد
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'phone': phone, 'password': password}),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      // فرض می‌کنیم توکن در responseData['access_token'] یا responseData['token'] قرار دارد
      final token = responseData['access_token'] ?? responseData['token'];
      if (token != null) {
        await _saveToken(token);
        // همچنین ID کاربر را ذخیره می‌کنیم اگر در پاسخ باشد
        final userId = responseData['user_id'] ?? responseData['user']['id'];
        if (userId != null) {
          await _saveUserId(userId);
        }
      }
      return responseData;
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  // متد برای ذخیره توکن
  static Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_token', token);
  }

  // متد برای دریافت توکن
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_token');
  }

  // متد برای ذخیره User ID
  static Future<void> _saveUserId(dynamic userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user_id', userId is int ? userId : int.parse(userId.toString()));
  }

  // متد برای دریافت User ID
  static Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('user_id');
  }

  // متد برای حذف توکن و User ID (هنگام خروج)
  static Future<void> deleteTokenAndUserId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_token');
    await prefs.remove('user_id');
  }

  // متد برای ساخت هدر با توکن JWT
  static Future<Map<String, String>> _getAuthHeaders() async {
    final token = await getToken();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // متد برای ایجاد Accommodation جدید
  static Future<Map<String, dynamic>> createAccommodation(Map<String, dynamic> data) async {
    final url = Uri.parse('$_baseUrl/accommodations');
    final headers = await _getAuthHeaders();
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create accommodation: ${response.body}');
    }
  }

  // متد برای دریافت لیست Accommodation ها
  static Future<List<dynamic>> getAccommodations({
    String? name,
    List<int>? provinceIds,
    String? orderBy,
    String? orderDirection,
  }) async {
    final Map<String, String> queryParams = {};
    if (name != null && name.isNotEmpty) queryParams['name'] = name;
    if (provinceIds != null && provinceIds.isNotEmpty) queryParams['province_ids'] = provinceIds.join(',');
    if (orderBy != null && orderBy.isNotEmpty) queryParams['order_by'] = orderBy;
    if (orderDirection != null && orderDirection.isNotEmpty) queryParams['order_direction'] = orderDirection;

    final url = Uri.parse('$_baseUrl/accommodations').replace(queryParameters: queryParams);
    final headers = await _getAuthHeaders();
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['data'] ?? [];
    } else {
      throw Exception('Failed to get accommodations: ${response.body}');
    }
  }

  // متد برای دریافت لیست کاربران (برای پنل مدیریت)
  static Future<List<dynamic>> getUsers() async {
    final url = Uri.parse('$_baseUrl/users');
    final headers = await _getAuthHeaders(); // فرض می‌کنیم نیاز به توکن ادمین دارد
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['data'] ?? [];
    } else {
      throw Exception('Failed to get users: ${response.body}');
    }
  }

  // متد برای دریافت لیست استان‌ها
  static Future<List<dynamic>> getProvinces() async {
    final url = Uri.parse('$_baseUrl/config/provinces');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['data'] ?? [];
    } else {
      throw Exception('Failed to get provinces: ${response.body}');
    }
  }

  // متد برای دریافت لیست شهرهای یک استان
  static Future<List<dynamic>> getCities(int provinceId) async {
    final url = Uri.parse('$_baseUrl/config/$provinceId/cities');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['data'] ?? [];
    } else {
      throw Exception('Failed to get cities for province $provinceId: ${response.body}');
    }
  }
}
