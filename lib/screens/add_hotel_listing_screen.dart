// File: screens/add_hotel_listing_screen.dart
import 'package:flutter/material.dart';
import 'package:hotel_reservation_app/services/api_service.dart'; // Import ApiService

class AddHotelListingScreen extends StatefulWidget {
  const AddHotelListingScreen({super.key});

  @override
  State<AddHotelListingScreen> createState() => _AddHotelListingScreenState();
}

class _AddHotelListingScreenState extends State<AddHotelListingScreen> {
  final _formKey = GlobalKey<FormState>(); // کلید برای اعتبارسنجی فرم
  final TextEditingController _hotelNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _pricePerNightController = TextEditingController();

  // متغیر برای نگهداری مسیر تصویر انتخاب شده (شبیه‌سازی)
  String? _selectedImagePath; // مسیر تصویر انتخاب شده

  bool _hasWifi = false; // امکانات: وای‌فای
  bool _hasPool = false; // امکانات: استخر
  bool _hasParking = false; // امکانات: پارکینگ
  bool _hasRestaurant = false; // امکانات: رستوران
  bool _hasTv = false; // امکانات: تلویزیون
  bool _hasKitchen = false; // امکانات: آشپزخانه
  bool _hasBathroom = false; // امکانات: حمام

  // برای مدیریت وضعیت بارگذاری
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Hotel Listing', style: TextStyle(color: Colors.white)), // اضافه کردن لیست هتل جدید
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // بخش بارگذاری عکس (شبیه به تصویر ارسالی)
              Center(
                child: GestureDetector(
                  onTap: () {
                    // TODO: قابلیت واقعی انتخاب عکس از گالری/دوربین
                    print('Image upload area tapped'); // ناحیه بارگذاری عکس لمس شد
                    setState(() {
                      _selectedImagePath = 'assets/images/hotel_placeholder.jpg'; // شبیه‌سازی انتخاب عکس
                    });
                  },
                  child: Container(
                    width: 120, // اندازه کوچکتر
                    height: 120, // اندازه کوچکتر
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200, // رنگ خاکستری روشن
                      borderRadius: BorderRadius.circular(15), // گوشه‌های گرد
                      border: Border.all(color: Colors.grey.shade400, width: 2), // حاشیه
                      image: _selectedImagePath != null
                          ? DecorationImage(
                        image: AssetImage(_selectedImagePath!),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                    child: _selectedImagePath == null
                        ? Icon(
                      Icons.camera_alt,
                      size: 50,
                      color: Colors.grey.shade600,
                    )
                        : null, // اگر عکس انتخاب شده باشد، چیزی نمایش نمی‌دهیم
                  ),
                ),
              ),
              const SizedBox(height: 30), // فاصله بیشتر

              // فیلد نام هتل
              TextFormField(
                controller: _hotelNameController,
                decoration: _buildInputDecoration('Hotel Name', Icons.hotel), // نام هتل
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter hotel name'; // لطفا نام هتل را وارد کنید
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // فیلد هزینه اتاق هتل (تغییر نام از Price per Night)
              TextFormField(
                controller: _pricePerNightController,
                keyboardType: TextInputType.number,
                decoration: _buildInputDecoration('Hotel Room Charges', Icons.attach_money), // هزینه اتاق هتل
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter room charges'; // لطفا هزینه اتاق را وارد کنید
                  }
                  if (double.tryParse(value) == null || double.parse(value) <= 0) {
                    return 'Please enter a valid amount'; // لطفا یک مبلغ معتبر وارد کنید
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // فیلد آدرس هتل (تغییر نام از Address)
              TextFormField(
                controller: _addressController,
                decoration: _buildInputDecoration('Hotel Address', Icons.location_on), // آدرس هتل
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter hotel address'; // لطفا آدرس هتل را وارد کنید
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // بخش خدمات (Services)
              const Text(
                'What service you want to offer?', // چه خدماتی می‌خواهید ارائه دهید؟
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 10),
              // چک‌باکس‌های خدمات با آیکون
              _buildCheckboxListTile('Wi-Fi', Icons.wifi, _hasWifi, (bool? value) {
                setState(() { _hasWifi = value ?? false; });
              }),
              _buildCheckboxListTile('HDTV', Icons.tv, _hasTv, (bool? value) {
                setState(() { _hasTv = value ?? false; });
              }),
              _buildCheckboxListTile('Swimming Pool', Icons.pool, _hasPool, (bool? value) {
                setState(() { _hasPool = value ?? false; });
              }),
              _buildCheckboxListTile('Parking', Icons.local_parking, _hasParking, (bool? value) {
                setState(() { _hasParking = value ?? false; });
              }),
              _buildCheckboxListTile('Restaurant', Icons.restaurant, _hasRestaurant, (bool? value) {
                setState(() { _hasRestaurant = value ?? false; });
              }),
              _buildCheckboxListTile('Kitchen', Icons.kitchen, _hasKitchen, (bool? value) {
                setState(() { _hasKitchen = value ?? false; });
              }),
              _buildCheckboxListTile('Bathroom', Icons.bathroom, _hasBathroom, (bool? value) {
                setState(() { _hasBathroom = value ?? false; });
              }),
              const SizedBox(height: 20),

              // فیلد توضیحات (Description)
              const Text(
                'Hotel Description', // توضیحات هتل
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _descriptionController,
                  maxLines: 6,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter About Hotel ...", // درباره هتل وارد کنید
                    hintStyle: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter hotel description'; // لطفا توضیحات هتل را وارد کنید
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20.0),

              // دکمه ثبت هتل
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _isLoading = true;
                      });
                      // ساخت یک Map از اطلاعات کامل هتل جدید برای ارسال به API
                      final int? ownerId = await ApiService.getUserId(); // دریافت owner_id کاربر لاگین شده

                      if (ownerId == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Error: User not logged in or owner ID not found.')), // خطا: کاربر وارد نشده یا owner ID یافت نشد.
                        );
                        setState(() { _isLoading = false; });
                        return;
                      }

                      final hotelDataForApi = {
                        'name': _hotelNameController.text,
                        'province_id': 18, // TODO: اینها باید از API config دریافت شوند
                        'city_id': 70, // TODO: اینها باید از API config دریافت شوند
                        'price_per_day': int.tryParse(_pricePerNightController.text) ?? 0,
                        'address': _addressController.text,
                        'owner_id': ownerId, // استفاده از owner_id واقعی
                        // 'specifications': { // اگر بک‌اند فیلد specifications را می‌پذیرد
                        //   'description': _descriptionController.text,
                        //   'amenities': {
                        //     'wifi': _hasWifi, 'pool': _hasPool, 'parking': _hasParking,
                        //     'restaurant': _hasRestaurant, 'tv': _hasTv, 'kitchen': _hasKitchen, 'bathroom': _hasBathroom,
                        //   },
                        // },
                        // توجه: API شما فیلدهای description و amenities را مستقیماً در create accommodations ندارد.
                        // در یک پروژه واقعی، باید API را به‌روزرسانی کنید یا این فیلدها را در 'specifications' قرار دهید.
                      };

                      try {
                        final response = await ApiService.createAccommodation(hotelDataForApi);
                        if (response['status'] == 'success' || response['id'] != null) {
                          // ساخت یک Map از اطلاعات کامل هتل جدید برای بازگشت به صفحه قبلی
                          // این شامل اطلاعاتی است که در UI فرانت‌اند نمایش داده می‌شود.
                          final newHotel = {
                            'hotelName': _hotelNameController.text,
                            'image': _selectedImagePath ?? 'assets/images/hotel_placeholder.jpg',
                            'rating': 'New',
                            'price': '${_pricePerNightController.text} Toman',
                            'location': _addressController.text,
                            'description': _descriptionController.text,
                            'amenities': {
                              'wifi': _hasWifi, 'pool': _hasPool, 'parking': _hasParking,
                              'restaurant': _hasRestaurant, 'tv': _hasTv, 'kitchen': _hasKitchen, 'bathroom': _hasBathroom,
                            },
                          };
                          Navigator.pop(context, newHotel);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Hotel listing submitted successfully!')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Failed to submit hotel: ${response['message'] ?? 'Unknown error'}')),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error submitting hotel: $e')),
                        );
                      } finally {
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: const Text('Submit Hotel Listing'), // ثبت لیست هتل
                ),
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }

  // ویجت کمکی برای ظاهر فیلدهای ورودی
  InputDecoration _buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: Colors.white.withOpacity(0.9),
    );
  }

  // ویجت کمکی برای چک‌باکس‌ها با آیکون
  Widget _buildCheckboxListTile(String title, IconData icon, bool value, ValueChanged<bool?> onChanged) {
    return CheckboxListTile(
      title: Row(
        children: [
          Icon(icon, color: Colors.blue.shade700, size: 24), // آیکون آبی رنگ
          const SizedBox(width: 10), // فاصله بین آیکون و متن
          Text(title),
        ],
      ),
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading, // چک‌باکس در سمت چپ
      contentPadding: EdgeInsets.zero, // حذف پدینگ اضافی
    );
  }

  @override
  void dispose() {
    _hotelNameController.dispose();
    _addressController.dispose();
    _descriptionController.dispose();
    _pricePerNightController.dispose();
    super.dispose();
  }
}
