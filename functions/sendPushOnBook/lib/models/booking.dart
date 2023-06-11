import 'dart:convert';

import 'package:collection/collection.dart';

class Booking {
  String? id;
  String? caId;
  String? status;
  DateTime? requestStartedOn;
  DateTime? requestEndedOn;
  String? cusId;
  List<dynamic>? permissions;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? collectionId;
  String? databaseId;

  Booking({
    this.id,
    this.caId,
    this.status,
    this.requestStartedOn,
    this.requestEndedOn,
    this.cusId,
    this.permissions,
    this.createdAt,
    this.updatedAt,
    this.collectionId,
    this.databaseId,
  });

  @override
  String toString() {
    return 'Booking(id: $id, caId: $caId, status: $status, requestStartedOn: $requestStartedOn, requestEndedOn: $requestEndedOn, cusId: $cusId, id: $id, permissions: $permissions, createdAt: $createdAt, updatedAt: $updatedAt, collectionId: $collectionId, databaseId: $databaseId)';
  }

  factory Booking.fromMap(Map<String, dynamic> data) => Booking(
        id: data['id'] as String?,
        caId: data['ca_id'] as String?,
        status: data['status'] as String?,
        requestStartedOn: data['request_started_on'] == null
            ? null
            : DateTime.parse(data['request_started_on'] as String),
        requestEndedOn: data['request_ended_on'] == null
            ? null
            : DateTime.parse(data['request_ended_on'] as String),
        cusId: data['cus_id'] as String?,
        permissions: data['permissions'] as List<dynamic>?,
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
        collectionId: data['collectionId'] as String?,
        databaseId: data['databaseId'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'ca_id': caId,
        'status': status,
        'request_started_on': requestStartedOn?.toIso8601String(),
        'request_ended_on': requestEndedOn?.toIso8601String(),
        'cus_id': cusId,
        '$id': id,
        '$permissions': permissions,
        '$createdAt': createdAt?.toIso8601String(),
        '$updatedAt': updatedAt?.toIso8601String(),
        '$collectionId': collectionId,
        '$databaseId': databaseId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Booking].
  factory Booking.fromJson(String data) {
    return Booking.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Booking] to a JSON string.
  String toJson() => json.encode(toMap());

  Booking copyWith({
    String? id,
    String? caId,
    String? status,
    DateTime? requestStartedOn,
    DateTime? requestEndedOn,
    String? cusId,
    List<dynamic>? permissions,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? collectionId,
    String? databaseId,
  }) {
    return Booking(
      id: id ?? this.id,
      caId: caId ?? this.caId,
      status: status ?? this.status,
      requestStartedOn: requestStartedOn ?? this.requestStartedOn,
      requestEndedOn: requestEndedOn ?? this.requestEndedOn,
      cusId: cusId ?? this.cusId,
      permissions: permissions ?? this.permissions,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      collectionId: collectionId ?? this.collectionId,
      databaseId: databaseId ?? this.databaseId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Booking) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      caId.hashCode ^
      status.hashCode ^
      requestStartedOn.hashCode ^
      requestEndedOn.hashCode ^
      cusId.hashCode ^
      id.hashCode ^
      permissions.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      collectionId.hashCode ^
      databaseId.hashCode;
}
