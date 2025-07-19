import 'package:flutter/material.dart';

class ServiceProviderPanelScreen extends StatelessWidget {
  const ServiceProviderPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel Servis Dahande', style: TextStyle(color: Colors.white)), // Panel Servis Dahande
        backgroundColor: Colors.blue.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Sabt Nam va Ehraz Hoviat'), // Sabt Nam va Ehraz Hoviat
            _buildFeatureCard(
              'Sabt Etelaat Shakhsi (P1)', // Sabt Etelaat Shakhsi
              'Sabt name karbar va etelaat shakhsi.', // Sabt name karbar...
            ),
            _buildFeatureCard(
              'Upload Madarek (P1)', // Upload Madarek
              'Upload madarek lazam baraye ehraz hoviat.', // Upload madarek...
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Modiriat Servisha'), // Modiriat Servisha
            _buildFeatureCard(
              'Daryaft Darkhastha (P1)', // Daryaft Darkhastha
              'Nemayesh darkhasthaye servis, pazirash ya rad darkhastha.', // Nemayesh darkhasthaye...
            ),
            _buildFeatureCard(
              'Taghir Vaziat (P1)', // Taghir Vaziat
              'Online/Offline shodan.', // Online/Offline shodan
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Mali va Daramad'), // Mali va Daramad
            _buildFeatureCard(
              'Moshahede Daramad (P2)', // Moshahede Daramad
              'Nemayesh daramad roozane, komision platform, va mablagh khales.', // Nemayesh daramad...
            ),
            _buildFeatureCard(
              'Tarikhche Servisha (P2)', // Tarikhche Servisha
              'Moshahede joziiat servishaye gozashte.', // Moshahede joziiat...
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Emtiyaz va Bazkhord'), // Emtiyaz va Bazkhord
            _buildFeatureCard(
              'Moshahede Emtiyazat va Nazarat (P3)', // Moshahede Emtiyazat va Nazarat
              'Moshahede emtiyazat va nazarat karbaran.', // Moshahede emtiyazat...
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Emkane Mokale Daroon Barname'), // Emkane Mokale Daroon Barname
            _buildFeatureCard(
              'Chat ba Servis Girande (REST API) (P2)', // Chat ba Servis Girande (REST API)
              'Chat kardan ba servis girande ba estefade az REST API.', // Chat kardan...
            ),
            _buildFeatureCard(
              'Chat ba Servis Girande (WebSocket) (P3)', // Chat ba Servis Girande (WebSocket)
              'Chat kardan ba servis girande ba estefade az WebSocket.', // Chat kardan...
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