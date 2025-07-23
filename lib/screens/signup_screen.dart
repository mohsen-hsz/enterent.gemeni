// File: screens/signup_screen.dart

import 'package:flutter/material.dart';
import 'package:hotel_reservation_app/services/api_service.dart'; // Import ApiService

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        final registerResponse = await ApiService.registerUser(
          _firstNameController.text,
          _lastNameController.text,
          _phoneController.text,
          _passwordController.text,
        );

        if (registerResponse['status'] == 'success' || registerResponse['id'] != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration successful! Now logging in...')), // ثبت‌نام موفق! در حال ورود...
          );
          // پس از ثبت‌نام موفق، تلاش می‌کنیم لاگین کنیم تا توکن دریافت شود
          final loginResponse = await ApiService.loginUser(_phoneController.text, _passwordController.text);
          if (loginResponse['status'] == 'success' || loginResponse['access_token'] != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login successful after registration!')), // ورود موفق پس از ثبت‌نام!
            );
            Navigator.pushReplacementNamed(context, '/role_selection');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Login failed after registration: ${loginResponse['message'] ?? 'Unknown error'}')), // ورود ناموفق پس از ثبت‌نام
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Registration failed: ${registerResponse['message'] ?? 'Unknown error'}')), // ثبت‌نام ناموفق
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error during registration: $e')), // خطا در هنگام ثبت‌نام
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/signup.png',
                      height: 170,
                      width: 350,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: _firstNameController,
                      decoration: _buildInputDecoration('First Name', Icons.person_outline),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: _buildInputDecoration('Last Name', Icons.person_outline),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: _buildInputDecoration('Mobile Number', Icons.phone),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your mobile number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: _buildInputDecoration('Password', Icons.lock),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    _isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                      onPressed: _register,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.blue.shade700,
                        foregroundColor: Colors.white,
                        elevation: 5,
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Already have an account? Login',
                        style: TextStyle(color: Colors.blue.shade700, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

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

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
