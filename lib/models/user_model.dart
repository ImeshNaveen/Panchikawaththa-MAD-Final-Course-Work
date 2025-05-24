import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String profileImageUrl;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.profileImageUrl,
  });

  /// Creates a UserModel from a map (e.g., from Firestore or JSON).
  factory UserModel.fromMap(Map<String, dynamic> map, {String? documentId}) {
    return UserModel(
      uid: documentId ?? map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      profileImageUrl: map['profileImageUrl'] ?? '',
    );
  }

  /// Convenience method for creating from a DocumentSnapshot.
  factory UserModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel.fromMap(data, documentId: doc.id);
  }

  /// Converts a UserModel instance to a map (for Firestore or JSON).
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'profileImageUrl': profileImageUrl,
    };
  }

  /// Allows copying the user with modified fields.
  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? phone,
    String? profileImageUrl,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }
}
