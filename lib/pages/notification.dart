import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: NotificationsPage()));
}

class NotificationsPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      "title": "Shop100970818 store",
      "subtitle": "Order Confirmed",
      "date": "17/09",
      "type": "shop"
    },
    {
      "title": "Shop498764042 store",
      "subtitle": "Order Confirmed",
      "date": "10/09",
      "type": "shop"
    },
    {
      "title": "Shop106782349240 store",
      "subtitle": "Order Confirmed",
      "date": "09/09",
      "type": "shop"
    },
    {
      "title": "seller 342211",
      "subtitle": "yes !",
      "date": "04/09",
      "type": "seller"
    },
    {
      "title": "Shop100544343 store",
      "subtitle": "Order Confirmed",
      "date": "04/09",
      "type": "shop"
    },
    {
      "title": "seller 534232445",
      "subtitle": "Order Confirmed",
      "date": "01/09",
      "type": "seller"
    },
    {
      "title": "Shop100970818 store",
      "subtitle": "Order Confirmed",
      "date": "24/08",
      "type": "shop"
    },
    {
      "title": "Shop100970818 store",
      "subtitle": "Order Confirmed",
      "date": "17/09",
      "type": "shop"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications',
            style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
        actions: [
          IconButton(
              icon: Icon(Icons.cleaning_services_outlined), onPressed: () {})
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(8),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(
                  item['type'] == 'shop' ? Icons.storefront : Icons.person,
                  size: 36,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['title']!,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(item['subtitle']!,
                          style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                ),
                Text(item['date']!, style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/profile.jpg'), // Replace with your image
              radius: 12,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
