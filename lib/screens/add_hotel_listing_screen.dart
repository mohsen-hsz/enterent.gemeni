// File: screens/add_hotel_listing_screen.dart
import 'package:flutter/material.dart';

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
              const Text(
                'Enter Hotel Details to List', // جزئیات هتل برای لیست شدن
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 20),

              // بخش بارگذاری عکس
              Center(
                child: GestureDetector(
                  onTap: () {
                    // TODO: قابلیت واقعی انتخاب عکس از گالری/دوربین
                    print('Image upload area tapped'); // ناحیه بارگذاری عکس لمس شد
                    // در اینجا می‌توانید یک Image Picker را شبیه‌سازی کنید
                    setState(() {
                      _selectedImagePath = 'assets/images/hotel_placeholder.jpg'; // شبیه‌سازی انتخاب عکس
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade400, width: 2),
                      image: _selectedImagePath != null
                          ? DecorationImage(
                        image: AssetImage(_selectedImagePath!),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                    child: _selectedImagePath == null
                        ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_a_photo,
                          size: 50,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Tap to upload hotel image', // برای بارگذاری عکس هتل ضربه بزنید
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                        ),
                      ],
                    )
                        : null, // اگر عکس انتخاب شده باشد، چیزی نمایش نمی‌دهیم
                  ),
                ),
              ),
              const SizedBox(height: 20),

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

              // فیلد آدرس
              TextFormField(
                controller: _addressController,
                decoration: _buildInputDecoration('Address', Icons.location_on), // آدرس
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter hotel address'; // لطفا آدرس هتل را وارد کنید
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // فیلد قیمت هر شب
              TextFormField(
                controller: _pricePerNightController,
                keyboardType: TextInputType.number,
                decoration: _buildInputDecoration('Price per Night (Toman)', Icons.attach_money), // قیمت هر شب (تومان)
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter price per night'; // لطفا قیمت هر شب را وارد کنید
                  }
                  if (double.tryParse(value) == null || double.parse(value) <= 0) {
                    return 'Please enter a valid price'; // لطفا یک قیمت معتبر وارد کنید
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // فیلد توضیحات
              TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: _buildInputDecoration('Description', Icons.description), // توضیحات
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter hotel description'; // لطفا توضیحات هتل را وارد کنید
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              const Text(
                'Amenities', // امکانات
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 10),
              // چک‌باکس امکانات
              _buildCheckboxListTile('Wi-Fi', _hasWifi, (bool? value) {
                setState(() { _hasWifi = value ?? false; });
              }),
              _buildCheckboxListTile('Swimming Pool', _hasPool, (bool? value) {
                setState(() { _hasPool = value ?? false; });
              }),
              _buildCheckboxListTile('Parking', _hasParking, (bool? value) {
                setState(() { _hasParking = value ?? false; });
              }),
              _buildCheckboxListTile('Restaurant', _hasRestaurant, (bool? value) {
                setState(() { _hasRestaurant = value ?? false; });
              }),
              _buildCheckboxListTile('TV', _hasTv, (bool? value) {
                setState(() { _hasTv = value ?? false; });
              }),
              _buildCheckboxListTile('Kitchen', _hasKitchen, (bool? value) {
                setState(() { _hasKitchen = value ?? false; });
              }),
              _buildCheckboxListTile('Bathroom', _hasBathroom, (bool? value) {
                setState(() { _hasBathroom = value ?? false; });
              }),
              const SizedBox(height: 30),

              // دکمه ثبت هتل
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // ساخت یک Map از اطلاعات کامل هتل جدید
                      final newHotel = {
                        'hotelName': _hotelNameController.text,
                        'image': _selectedImagePath ?? 'assets/images/hotel_placeholder.jpg', // استفاده از تصویر انتخاب شده
                        'rating': 'New', // می‌توانید منطق امتیازدهی اضافه کنید
                        'price': '${_pricePerNightController.text} Toman',
                        'location': _addressController.text,
                        'description': _descriptionController.text,
                        'amenities': {
                          'wifi': _hasWifi,
                          'pool': _hasPool,
                          'parking': _hasParking,
                          'restaurant': _hasRestaurant,
                          'tv': _hasTv,
                          'kitchen': _hasKitchen,
                          'bathroom': _hasBathroom,
                        },
                      };

                      // بازگرداندن اطلاعات هتل جدید به صفحه قبلی
                      Navigator.pop(context, newHotel);

                      // نمایش پیام موفقیت (این پیام در صفحه اصلی نمایش داده می‌شود)
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Hotel listing submitted successfully!')), // لیست هتل با موفقیت ثبت شد!
                      );
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

  // ویجت کمکی برای چک‌باکس‌ها
  Widget _buildCheckboxListTile(String title, bool value, ValueChanged<bool?> onChanged) {
    return CheckboxListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading, // آیکون در سمت چپ
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
