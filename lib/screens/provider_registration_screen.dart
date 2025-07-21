// File: screens/provider_registration_screen.dart
import 'package:flutter/material.dart';

class ProviderRegistrationScreen extends StatefulWidget {
  const ProviderRegistrationScreen({super.key});

  @override
  State<ProviderRegistrationScreen> createState() => _ProviderRegistrationScreenState();
}

class _ProviderRegistrationScreenState extends State<ProviderRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _nationalCodeController = TextEditingController();
  final TextEditingController _hotelNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();

  String? _documentPath; // مسیر سند آپلود شده (شبیه‌سازی)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Registration', style: TextStyle(color: Colors.white)), // ثبت‌نام سرویس‌دهنده
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
                'Personal Information', // اطلاعات شخصی
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _fullNameController,
                decoration: _buildInputDecoration('Full Name', Icons.person), // نام کامل
                validator: (value) => value!.isEmpty ? 'Please enter full name' : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _nationalCodeController,
                decoration: _buildInputDecoration('National ID', Icons.credit_card), // کد ملی
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Please enter national ID' : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _hotelNameController,
                decoration: _buildInputDecoration('Hotel Name', Icons.hotel), // نام هتل
                validator: (value) => value!.isEmpty ? 'Please enter hotel name' : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _mobileNumberController,
                decoration: _buildInputDecoration('Mobile Number', Icons.phone), // شماره همراه
                keyboardType: TextInputType.phone,
                validator: (value) => value!.isEmpty ? 'Please enter mobile number' : null,
              ),
              const SizedBox(height: 30),

              const Text(
                'Document Upload', // آپلود مدارک
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // TODO: قابلیت واقعی انتخاب فایل
                    print('Document upload area tapped'); // ناحیه آپلود مدرک لمس شد
                    setState(() {
                      _documentPath = 'assets/images/document_placeholder.png'; // شبیه‌سازی آپلود سند
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade400, width: 2),
                      image: _documentPath != null
                          ? DecorationImage(
                        image: AssetImage(_documentPath!),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                    child: _documentPath == null
                        ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.upload_file,
                          size: 50,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Tap to upload documents', // برای آپلود مدارک ضربه بزنید
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                        ),
                      ],
                    )
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('Provider Registration Submitted'); // ثبت‌نام سرویس‌دهنده ارسال شد
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Registration submitted successfully!')), // ثبت‌نام با موفقیت ارسال شد!
                      );
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: const Text('Submit Registration'), // ارسال ثبت‌نام
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: Colors.white.withOpacity(0.9),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _nationalCodeController.dispose();
    _hotelNameController.dispose();
    _mobileNumberController.dispose();
    super.dispose();
  }
}
