import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotificationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> addNotification({
    required String title,
    required String subtitle,
    required String type,
    required DateTime date,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user == null) throw Exception("User not logged in");

      final docRef = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('notifications')
          .add({
        'title': title,
        'subtitle': subtitle,
        'type': type,
        'date': Timestamp.fromDate(date),
        'isRead': false,
      });

      final token = await _messaging.getToken();
      if (token != null) {
        await _sendPushNotification(
          token: token,
          title: title,
          body: subtitle,
          notificationId: docRef.id,
        );
      }
    } catch (e) {
      print('Error adding notification: $e');
    }
  }

  Future<void> _sendPushNotification({
    required String token,
    required String title,
    required String body,
    required String notificationId,
  }) async {
    const String serverKey = 'YOUR_FCM_SERVER_KEY';
    const String fcmUrl = 'https://fcm.googleapis.com/fcm/send';

    final payload = {
      'to': token,
      'notification': {
        'title': title,
        'body': body,
        'sound': 'default',
      },
      'data': {
        'notificationId': notificationId,
        'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      },
    };

    final response = await http.post(
      Uri.parse(fcmUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverKey',
      },
      body: jsonEncode(payload),
    );

    if (response.statusCode != 200) {
      print('Failed to send push notification: ${response.body}');
    }
  }

  Stream<List<Map<String, dynamic>>> getNotifications({String? typeFilter}) {
    final user = _auth.currentUser;
    if (user == null) {
      print('No user logged in, returning empty stream');
      return Stream.value([]);
    }

    try {
      Query<Map<String, dynamic>> query = _firestore
          .collection('users')
          .doc(user.uid)
          .collection('notifications')
          .orderBy('date', descending: true);

      if (typeFilter != null) {
        query = query.where('type', isEqualTo: typeFilter);
      }

      return query.snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          final data = doc.data();
          return {
            'id': doc.id,
            'title': data['title'],
            'subtitle': data['subtitle'],
            'type': data['type'],
            'date': (data['date'] as Timestamp).toDate(),
            'isRead': data['isRead'],
          };
        }).toList();
      }).handleError((error) {
        print('Error fetching notifications: $error');
        throw error; // Re-throw to let StreamBuilder handle the error
      });
    } catch (e) {
      print('Error setting up notifications stream: $e');
      return Stream.error(e);
    }
  }

  Future<void> markAsRead(String notificationId) async {
    try {
      final user = _auth.currentUser;
      if (user == null) throw Exception("User not logged in");

      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('notifications')
          .doc(notificationId)
          .update({'isRead': true});
    } catch (e) {
      print('Error marking notification as read: $e');
    }
  }

  Future<void> deleteNotification(String notificationId) async {
    try {
      final user = _auth.currentUser;
      if (user == null) throw Exception("User not logged in");

      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('notifications')
          .doc(notificationId)
          .delete();
    } catch (e) {
      print('Error deleting notification: $e');
    }
  }

  Future<void> clearAllNotifications() async {
    try {
      final user = _auth.currentUser;
      if (user == null) throw Exception("User not logged in");

      final snapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('notifications')
          .get();

      final batch = _firestore.batch();
      for (var doc in snapshot.docs) {
        batch.delete(doc.reference);
      }
      await batch.commit();
    } catch (e) {
      print('Error clearing notifications: $e');
    }
  }
}