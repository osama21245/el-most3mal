// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  final String name;
  final String profilePic;
  final String uid;
  final bool isAuthanticated;
  final bool isonline;
  final String phone;

  UserModel({
    required this.name,
    required this.profilePic,
    required this.uid,
    required this.isAuthanticated,
    required this.isonline,
    required this.phone,
  });

  UserModel copyWith({
    String? name,
    String? profilePic,
    String? uid,
    bool? isAuthanticated,
    bool? isonline,
    String? phone,
  }) {
    return UserModel(
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      uid: uid ?? this.uid,
      isAuthanticated: isAuthanticated ?? this.isAuthanticated,
      isonline: isonline ?? this.isonline,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profilePic': profilePic,
      'uid': uid,
      'isAuthanticated': isAuthanticated,
      'isonline': isonline,
      'phone': phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      profilePic: map['profilePic'] as String,
      uid: map['uid'] as String,
      isAuthanticated: map['isAuthanticated'] as bool,
      isonline: map['isonline'] as bool,
      phone: map['phone'] as String,
    );
  }

  @override
  String toString() {
    return 'UserModel(name: $name, profilePic: $profilePic, uid: $uid, isAuthanticated: $isAuthanticated, isonline: $isonline, phone: $phone)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.profilePic == profilePic &&
        other.uid == uid &&
        other.isAuthanticated == isAuthanticated &&
        other.isonline == isonline &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        profilePic.hashCode ^
        uid.hashCode ^
        isAuthanticated.hashCode ^
        isonline.hashCode ^
        phone.hashCode;
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
