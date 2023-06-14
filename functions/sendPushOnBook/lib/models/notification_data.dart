import 'dart:convert';

import 'package:collection/collection.dart';

class NotificationData {
  String? caId;
  String? cusId;
  String? title;
  String? body;
  String? profilePic;
  String? createdAt;
  String? caName;
  String? customerName;

  NotificationData({
    this.caId,
    this.cusId,
    this.title,
    this.body,
    this.profilePic,
    this.createdAt,
    this.caName,
    this.customerName,
  });

  @override
  String toString() {
    return 'NotificationData(caId: $caId, cusId: $cusId, title: $title, body: $body, profilePic: $profilePic, createdAt: $createdAt)';
  }

  factory NotificationData.fromMap(Map<String, dynamic> data) {
    return NotificationData(
      caId: data['ca_id'] as String? ?? "",
      cusId: data['cus_id'] as String? ?? "",
      title: data['title'] as String? ?? "",
      body: data['body'] as String? ?? "",
      profilePic: data['profile_pic'] as String? ?? "",
      createdAt: data['created_at'] as String? ?? "",
      caName: data['ca_name'] as String? ?? "",
      customerName: data['customer_name'] as String? ?? "",
    );
  }

  Map<String, dynamic> toMap() => {
        'ca_id': caId,
        'cus_id': cusId,
        'title': title,
        'body': body,
        'profile_pic': profilePic,
        'created_at': createdAt,
        'ca_name': caName,
        'customer_name': customerName,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [NotificationData].
  factory NotificationData.fromJson(String data) {
    return NotificationData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [NotificationData] to a JSON string.
  String toJson() => json.encode(toMap());

  NotificationData copyWith({
    String? caId,
    String? cusId,
    String? title,
    String? body,
    String? profilePic,
    String? createdAt,
    String? caName,
    String? customerName,
  }) {
    return NotificationData(
      caId: caId ?? this.caId,
      cusId: cusId ?? this.cusId,
      title: title ?? this.title,
      body: body ?? this.body,
      profilePic: profilePic ?? this.profilePic,
      createdAt: createdAt ?? this.createdAt,
      caName: caName ?? this.caName,
      customerName: customerName ?? this.customerName,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! NotificationData) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      caId.hashCode ^
      cusId.hashCode ^
      title.hashCode ^
      body.hashCode ^
      profilePic.hashCode ^
      createdAt.hashCode;
}
