import 'dart:convert';

import 'package:flutter/material.dart';

class DiscussionModel {
  final String? email;
  final String? name;
  final String? pictureUrl;
  final DateTime timestamp;
  final String massage;
  DiscussionModel({
    required this.email,
    required this.name,
    required this.pictureUrl,
    required this.timestamp,
    required this.massage,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'pictureUrl': pictureUrl,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'massage': massage,
    };
  }

  factory DiscussionModel.fromMap(Map<String, dynamic> map) {
    return DiscussionModel(
      email: map['email'],
      name: map['name'],
      pictureUrl: map['pictureUrl'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
      massage: map['massage'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DiscussionModel.fromJson(String source) =>
      DiscussionModel.fromMap(json.decode(source));
}
