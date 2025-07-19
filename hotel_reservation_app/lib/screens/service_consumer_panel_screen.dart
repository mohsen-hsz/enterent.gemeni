import 'package:flutter/material.dart';

class ServiceConsumerPanelScreen extends StatelessWidget {
  const ServiceConsumerPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel Servis Girande', style: TextStyle(color: Colors.white)), // Panel Servis Girande
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Sabt Nam va Vorood'), // Sabt Nam va Vorood
            _buildFeatureCard(
              'Sabt Nam ba Shomare Hamrah/Email (P1)', // Sabt Nam ba Shomare Hamrah/Email
              'Sabt name karbar ba shomare hamrah ya email.', // Sabt name karbar...
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Darkhast Servis'), // Darkhast Servis
            _buildFeatureCard(
              'Entekhab Noe Servis (P1)', // Entekhab Noe Servis
              'Entekhab noe servis motenaseb ba projeh.', // Entekhab noe servis...
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Peygiri Vaziat Servis'), // Peygiri Vaziat Servis
            _buildFeatureCard(
              'Etelaat Servis Dahande (P1)', // Etelaat Servis Dahande
              'Moshakhasat servis dahande va vaziat servis.', // Moshakhasat servis dahande...
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Pardakht'), // Pardakht
            _buildFeatureCard(
              'Ravashhaye Pardakht (P2)', // Ravashhaye Pardakht
              'Nagdi, kife pool dakhili, kart banki.', // Nagdi, kife pool...
            ),
            _buildFeatureCard(
              'Takhfifha va Kouponha (P2)', // Takhfifha va Kouponha
              'Emaal code takhfif baraye safarha.', // Emaal code takhfif...
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Tarikhche va Nazarat'), // Tarikhche va Nazarat
            _buildFeatureCard(
              'Emtiyazdehi be Servis Dahande (P3)', // Emtiyazdehi be Servis Dahande
              'Emtiyaz dehi be servis dahande pas az takmil servis.', // Emtiyaz dehi...
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Emkane Mokale Daroon Barname'), // Emkane Mokale Daroon Barname
            _buildFeatureCard(
              'Chat ba Servis Dahande (REST API) (P2)', // Chat ba Servis Dahande (REST API)
              'Chat kardan ba servis dahande ba estefade az REST API.', // Chat kardan...
            ),
            _buildFeatureCard(
              'Chat ba Servis Dahande (WebSocket) (P3)', // Chat ba Servis Dahande (WebSocket)
              'Chat kardan ba servis dahande ba estefade az WebSocket.', // Chat kardan...
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