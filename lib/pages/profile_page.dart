import 'package:flutter/material.dart';
import 'setting_page.dart';
import 'notification.dart';

void main() {
  runApp(const Profilepage());
}

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const AccountPage(),
    );
  }
}

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  const Text(
                    'Account',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      // Navigate to settings page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingPage()),
                      );
                    },
                    child: const Icon(Icons.settings),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      // Navigate to settings page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationsPage()),
                      );
                    },
                    child: const Icon(Icons.notifications_none),
                  ),
                ],
              ),
            ),

            // Profile Card
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'John Snow',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.email, size: 16, color: Colors.grey),
                              SizedBox(width: 8),
                              Text(
                                'johnsnow@gmail.com',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.phone, size: 16, color: Colors.grey),
                              SizedBox(width: 8),
                              Text(
                                '+94 76 942 3847',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("assets/profile.jpeg"),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: const [
                              Text(
                                'Edit Profile',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  size: 12, color: Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Menu Icons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildMenuItem(Icons.headset, 'Help Center'),
                  _buildMenuItem(Icons.credit_card, 'Cards'),
                  _buildMenuItem(Icons.keyboard_return, 'Return'),
                  _buildMenuItem(Icons.card_giftcard, 'Coupons'),
                ],
              ),
            ),

            const Divider(height: 32),

            // Recent Purchases Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Purchases',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RecentPurchasesPage()),
                      );
                    },
                    child: const Text(
                      'Show all',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Recent Purchases List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildPurchaseItem(
                    'Item Name',
                    '375,000.00',
                    '5',
                    '75,000.00',
                    'assets/wheels.png',
                    isDelivered: false,
                  ),
                  _buildPurchaseItem(
                    'Exide Battery',
                    '45,000.00',
                    '1',
                    '45,000.00',
                    'assets/battery.png',
                  ),
                  _buildPurchaseItem(
                    'Turbo unit',
                    '75,000.00',
                    '1',
                    '75,000.00',
                    'assets/turbo.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildPurchaseItem(String name, String price, String quantity,
      String unitPrice, String imagePath,
      {bool isDelivered = true}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.image, size: 30, color: Colors.grey),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Qty: $quantity',
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  'LKR $unitPrice',
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'LKR $price',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Track Order',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(height: 4),
              if (isDelivered)
                Text(
                  'Delivery in 15th OCT',
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class RecentPurchasesPage extends StatelessWidget {
  const RecentPurchasesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // App bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios, size: 20),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Recent Purchases',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const Icon(Icons.notifications_none),
                ],
              ),
            ),

            const Divider(),

            // Purchases List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildPurchaseItem(
                    'Turbo unit',
                    '75,000.00',
                    '1',
                    '75,000.00',
                    isDelivered: false,
                  ),
                  _buildPurchaseItem(
                    'Item Name',
                    '375,000.00',
                    '5',
                    '75,000.00',
                    isDelivered: false,
                  ),
                  _buildPurchaseItem(
                    'Exide Battery',
                    '45,000.00',
                    '1',
                    '45,000.00',
                  ),
                  _buildPurchaseItem(
                    'Turbo unit',
                    '75,000.00',
                    '1',
                    '75,000.00',
                  ),
                  _buildPurchaseItem(
                    'Head Light',
                    '150,000.00',
                    '2',
                    '75,000.00',
                  ),
                  _buildPurchaseItem(
                    'Diesel Filter',
                    '15,000.00',
                    '1',
                    '15,000.00',
                  ),
                  _buildPurchaseItem(
                    'Turbo unit',
                    '75,000.00',
                    '1',
                    '75,000.00',
                    isDelivered: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPurchaseItem(
      String name, String price, String quantity, String unitPrice,
      {bool isDelivered = true}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: _getItemIcon(name),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Qty: $quantity',
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'LKR $unitPrice',
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 14),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'LKR $price',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Post review',
                      style: TextStyle(fontSize: 12, color: Colors.black87),
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (isDelivered)
                    const Text(
                      'Delivery in 9th OCT',
                      style: TextStyle(fontSize: 12, color: Colors.black87),
                    ),
                ],
              ),
            ],
          ),
          if (!isDelivered)
            Positioned(
              right: -20,
              top: 10,
              child: Transform.rotate(
                angle: 0.785398, // 45 degrees in radians
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  color: Colors.red,
                  child: const Text(
                    'DELIVERED',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _getItemIcon(String name) {
    IconData iconData;

    switch (name.toLowerCase()) {
      case 'turbo unit':
        iconData = Icons.settings;
        break;
      case 'exide battery':
        iconData = Icons.battery_full;
        break;
      case 'head light':
        iconData = Icons.lightbulb;
        break;
      case 'diesel filter':
        iconData = Icons.filter_alt;
        break;
      default:
        iconData = Icons.circle;
        break;
    }

    return Icon(iconData, size: 30, color: Colors.grey);
  }
}
