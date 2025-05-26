import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'notificationservice.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final NotificationService _notificationService = NotificationService();
  String? _selectedType;

  // Method to add a test notification
  Future<void> _addTestNotification() async {
    try {
      await _notificationService.addNotification(
        title: 'Test Shop',
        subtitle: 'Test Notification',
        type: 'shop',
        date: DateTime.now(), // May 26, 2025, 11:58 PM IST
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Test notification added')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding test notification: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.cleaning_services_outlined),
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Clear All Notifications'),
                  content: const Text(
                      'Are you sure you want to clear all notifications?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Clear'),
                    ),
                  ],
                ),
              );
              if (confirm == true) {
                await _notificationService.clearAllNotifications();
              }
            },
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: _selectedType,
              hint: const Text('Filter by Type'),
              isExpanded: true,
              items: [
                DropdownMenuItem<String>(
                  value: null,
                  child: Text('All'),
                ),
                DropdownMenuItem<String>(
                  value: 'shop',
                  child: Text('Shop'),
                ),
                DropdownMenuItem<String>(
                  value: 'seller',
                  child: Text('Seller'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedType = value;
                });
              },
            ),
          ),
          // Temporary button to add a test notification
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _addTestNotification,
              child: const Text('Add Test Notification'),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: _notificationService.getNotifications(typeFilter: _selectedType),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Error loading notifications: ${snapshot.error.toString()}',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {}); // Trigger a rebuild to retry
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No notifications'));
                }

                final notifications = snapshot.data!;

                return ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: notifications.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final item = notifications[index];
                    return Dismissible(
                      key: Key(item['id']),
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) async {
                        await _notificationService.deleteNotification(item['id']);
                      },
                      child: GestureDetector(
                        onTap: () async {
                          if (!item['isRead']) {
                            await _notificationService.markAsRead(item['id']);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: item['isRead']
                                ? const Color(0xFFF4F4F4)
                                : const Color(0xFFE8F0FE),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                item['type'] == 'shop'
                                    ? Icons.storefront
                                    : Icons.person,
                                size: 36,
                                color: item['isRead'] ? Colors.grey : Colors.blue,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['title'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: item['isRead']
                                            ? Colors.black
                                            : Colors.blue,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item['subtitle'],
                                      style: TextStyle(
                                        color: item['isRead']
                                            ? Colors.grey[600]
                                            : Colors.blue[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                DateFormat('dd/MM').format(item['date']),
                                style: TextStyle(
                                  color: item['isRead']
                                      ? Colors.grey[600]
                                      : Colors.blue[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}