// File: screens/admin_panel_screen.dart
import 'package:flutter/material.dart';

class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel Modiriat', style: TextStyle(color: Colors.white)), // Panel Modiriat
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Modiriat Servis Dahande va Servis Girande'), // Modiriat Servis Dahande va Servis Girande
            _buildFeatureCard(
              'Tayid Hoviat Servis Dahande (P1)', // Tayid Hoviat Servis Dahande
              'Barresi madarek servis dahande, moshahede list, faal/gheirfaal kardan hesab.', // Barresi madarek...
            ),
            _buildFeatureCard(
              'Modiriat Servis Girande (P1)', // Modiriat Servis Girande
              'Moshahede list servis girande, emkane masdood sazi hesab.', // Moshahede list...
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Modiriat Servisha'), // Modiriat Servisha
            _buildFeatureCard(
              'Moshahede Servishaye Faal (P1)', // Moshahede Servishaye Faal
              'Moshahede joziiat servis, filter bar asase parametrha.', // Moshahede joziiat...
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Modiriat Mali'), // Modiriat Mali
            _buildFeatureCard(
              'Mohasebe Daramad (P2)', // Mohasebe Daramad
              'Gozaresh daramad roozane/mahane.', // Gozaresh daramad...
            ),
            _buildFeatureCard(
              'Tarazkonishha (P2)', // Tarazkonishha
              'Moshahede tarazkonishhaye pardakht servis dahande va servis girande.', // Moshahede tarazkonishhaye...
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Gozareshgiri va Tahlil'), // Gozareshgiri va Tahlil
            _buildFeatureCard(
              'Gozaresh Amalkard Servis Dahandegan (P2)', // Gozaresh Amalkard Servis Dahandegan
              'Emtiyaz motavasset, mizane daramad.', // Emtiyaz motavasset...
            ),
            _buildFeatureCard(
              'Gozaresh Nazarat Servis Girandegan (P2)', // Gozaresh Nazarat Servis Girandegan
              'Nemayesh nazarat va emtiyazat.', // Nemayesh nazarat...
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue.shade800,
        ),
      ),
    );
  }

  Widget _buildFeatureCard(String title, String description) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}