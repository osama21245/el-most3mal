// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductModel {
  String id;
  String username;
  String userid;
  List<dynamic> images;
  DateTime date;
  String userimage;
  String productname;
  String productprice;
  String userLocation;
  String productDescription;
  String userPhone;
  double lang;
  double lat;

  ProductModel({
    required this.id,
    required this.username,
    required this.userid,
    required this.images,
    required this.date,
    required this.userimage,
    required this.productname,
    required this.productprice,
    required this.userLocation,
    required this.productDescription,
    required this.userPhone,
    required this.lang,
    required this.lat,
  });

  ProductModel copyWith({
    String? id,
    String? username,
    String? userid,
    List<dynamic>? images,
    DateTime? date,
    String? userimage,
    String? productname,
    String? productprice,
    String? userLocation,
    String? productDescription,
    String? userPhone,
    double? lang,
    double? lat,
  }) {
    return ProductModel(
      id: id ?? this.id,
      username: username ?? this.username,
      userid: userid ?? this.userid,
      images: images ?? this.images,
      date: date ?? this.date,
      userimage: userimage ?? this.userimage,
      productname: productname ?? this.productname,
      productprice: productprice ?? this.productprice,
      userLocation: userLocation ?? this.userLocation,
      productDescription: productDescription ?? this.productDescription,
      userPhone: userPhone ?? this.userPhone,
      lang: lang ?? this.lang,
      lat: lat ?? this.lat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'userid': userid,
      'images': images,
      'date': date.millisecondsSinceEpoch,
      'userimage': userimage,
      'productname': productname,
      'productprice': productprice,
      'userLocation': userLocation,
      'productDescription': productDescription,
      'userPhone': userPhone,
      'lang': lang,
      'lat': lat,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      username: map['username'] as String,
      userid: map['userid'] as String,
      images: List<dynamic>.from((map['images'] as List<dynamic>)),
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      userimage: map['userimage'] as String,
      productname: map['productname'] as String,
      productprice: map['productprice'] as String,
      userLocation: map['userLocation'] as String,
      productDescription: map['productDescription'] as String,
      userPhone: map['userPhone'] as String,
      lang: map['lang'] as double,
      lat: map['lat'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, username: $username, userid: $userid, images: $images, date: $date, userimage: $userimage, productname: $productname, productprice: $productprice, userLocation: $userLocation, productDescription: $productDescription, userPhone: $userPhone, lang: $lang, lat: $lat)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.userid == userid &&
        listEquals(other.images, images) &&
        other.date == date &&
        other.userimage == userimage &&
        other.productname == productname &&
        other.productprice == productprice &&
        other.userLocation == userLocation &&
        other.productDescription == productDescription &&
        other.userPhone == userPhone &&
        other.lang == lang &&
        other.lat == lat;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        userid.hashCode ^
        images.hashCode ^
        date.hashCode ^
        userimage.hashCode ^
        productname.hashCode ^
        productprice.hashCode ^
        userLocation.hashCode ^
        productDescription.hashCode ^
        userPhone.hashCode ^
        lang.hashCode ^
        lat.hashCode;
  }
}
