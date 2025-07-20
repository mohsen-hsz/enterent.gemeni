import 'package:flutter/material.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wallet', style: TextStyle(color: Colors.white)), // کیف پول من
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // بخش موجودی کیف پول (Wallet Balance Section)
            Card(
              margin: const EdgeInsets.only(bottom: 20.0),
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Online Payment Balance', // موجودی پرداخت آنلاین
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '0 Rial', // 0 ریال
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // TODO: قابلیت افزایش موجودی
                            print('Increase Balance button pressed'); // دکمه افزایش موجودی فشرده شد
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade600,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          ),
                          child: const Text('Increase Balance'), // افزایش موجودی
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // بخش روش‌های پرداخت (Payment Methods Section)
            const Text(
              'Payment Methods', // روش‌های پرداخت
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 15),

            // کارت پرداخت مستقیم (Direct Payment Card)
            Card(
              margin: const EdgeInsets.only(bottom: 15.0),
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Colors.blue.shade700,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Direct Payment', // پرداخت مستقیم
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'No card, direct to payment!', // بدون کارت، مستقیم تا پرداخت!
                            style: TextStyle(fontSize: 14, color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: قابلیت فعالسازی پرداخت مستقیم
                        print('Activate Direct Payment button pressed'); // دکمه فعالسازی پرداخت مستقیم فشرده شد
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue.shade700,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      ),
                      child: const Text('Activate'), // فعالسازی
                    ),
                  ],
                ),
              ),
            ),

            // گزینه پرداخت آنلاین (Online Payment Option)
            Card(
              margin: const EdgeInsets.only(bottom: 15.0),
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: Radio<bool>(
                  value: true, // فرض می‌کنیم فعال است
                  groupValue: true, // همیشه انتخاب شده
                  onChanged: (bool? value) {
                    // TODO: مدیریت انتخاب پرداخت آنلاین
                    print('Online Payment selected'); // پرداخت آنلاین انتخاب شد
                  },
                ),
                title: const Text(
                  'Online Payment', // پرداخت آنلاین
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                trailing: const Icon(Icons.credit_card, color: Colors.blue), // آیکون کارت
                onTap: () {
                  // TODO: مدیریت کلیک روی گزینه پرداخت آنلاین
                  print('Online Payment option tapped'); // گزینه پرداخت آنلاین لمس شد
                },
              ),
            ),

            // گزینه اسنپ کارت (Snap Card Option)
            Card(
              margin: const EdgeInsets.only(bottom: 15.0),
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: Radio<bool>(
                  value: false, // فرض می‌کنیم غیرفعال است
                  groupValue: true, // گروه رادیو
                  onChanged: (bool? value) {
                    // TODO: مدیریت انتخاب اسنپ کارت
                    print('Snap Card selected'); // اسنپ کارت انتخاب شد
                  },
                ),
                title: const Text(
                  'Snap Card', // اسنپ کارت
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                trailing: const Icon(Icons.wallet, color: Colors.blue), // آیکون کیف پول
                onTap: () {
                  // TODO: مدیریت کلیک روی گزینه اسنپ کارت
                  print('Snap Card option tapped'); // گزینه اسنپ کارت لمس شد
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}