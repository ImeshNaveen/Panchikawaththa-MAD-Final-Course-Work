import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications',
            style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.cleaning_services_outlined),
            onPressed: () {
              // Add logic to clear notifications if needed
            },
          )
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('notifications')
            .orderBy('date', descending: true) // optional
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Loading state
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Error state
            return Center(child: Text('Error loading notifications'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            // No data state
            return Center(child: Text('No notifications'));
          }

          final notifications = snapshot.data!.docs;

          return ListView.separated(
            padding: EdgeInsets.all(8),
            itemCount: notifications.length,
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemBuilder: (context, index) {
              final doc = notifications[index];
              final title = doc['title'] ?? 'No title';
              final subtitle = doc['subtitle'] ?? '';
              final date = doc['date'] ?? '';
              final type = doc['type'] ?? 'shop';

              return Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      type == 'shop' ? Icons.storefront : Icons.person,
                      size: 36,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text(subtitle,
                              style: TextStyle(color: Colors.grey[600])),
                        ],
                      ),
                    ),
                    Text(date, style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
