import 'package:flutter/material.dart';

class ServiceCenterPage extends StatelessWidget {
  const ServiceCenterPage({super.key});

  final List<Map<String, String>> serviceCenters = const [
    {
      "name": "Colombo Service Center",
      "address": "123 Main Street, Colombo 07",
      "phone": "+94 11 234 5678"
    },
    {
      "name": "Kandy Service Center",
      "address": "45 Lake Road, Kandy",
      "phone": "+94 81 222 3344"
    },
    {
      "name": "Galle Service Center",
      "address": "78 Beach Road, Galle",
      "phone": "+94 91 567 8901"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Center'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: serviceCenters.length,
        itemBuilder: (context, index) {
          final center = serviceCenters[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    center["name"]!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.grey),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(center["address"]!),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.phone, color: Colors.grey),
                      const SizedBox(width: 6),
                      Text(center["phone"]!),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
