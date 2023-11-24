// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Chats {
  final String name;
  final String profilepic;
  final String contactId;
  final DateTime timeSent;
  final String lastMessage;
  final bool isSeen;
  final String productId;

  Chats({
    required this.name,
    required this.profilepic,
    required this.contactId,
    required this.timeSent,
    required this.lastMessage,
    required this.isSeen,
    required this.productId,
  });

  Chats copyWith({
    String? name,
    String? profilepic,
    String? contactId,
    DateTime? timeSent,
    String? lastMessage,
    bool? isSeen,
    String? productId,
    String? productPrice,
    String? sellerLocation,
  }) {
    return Chats(
      name: name ?? this.name,
      profilepic: profilepic ?? this.profilepic,
      contactId: contactId ?? this.contactId,
      timeSent: timeSent ?? this.timeSent,
      lastMessage: lastMessage ?? this.lastMessage,
      isSeen: isSeen ?? this.isSeen,
      productId: productId ?? this.productId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profilepic': profilepic,
      'contactId': contactId,
      'timeSent': timeSent.millisecondsSinceEpoch,
      'lastMessage': lastMessage,
      'isSeen': isSeen,
      'productId': productId,
    };
  }

  factory Chats.fromMap(Map<String, dynamic> map) {
    return Chats(
      name: map['name'] as String,
      profilepic: map['profilepic'] as String,
      contactId: map['contactId'] as String,
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent'] as int),
      lastMessage: map['lastMessage'] as String,
      isSeen: map['isSeen'] as bool,
      productId: map['productId'] as String,
    );
  }

  @override
  String toString() {
    return 'Chats(name: $name, profilepic: $profilepic, contactId: $contactId, timeSent: $timeSent, lastMessage: $lastMessage, isSeen: $isSeen, productId: $productId)';
  }

  @override
  bool operator ==(covariant Chats other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.profilepic == profilepic &&
        other.contactId == contactId &&
        other.timeSent == timeSent &&
        other.lastMessage == lastMessage &&
        other.isSeen == isSeen &&
        other.productId == productId;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        profilepic.hashCode ^
        contactId.hashCode ^
        timeSent.hashCode ^
        lastMessage.hashCode ^
        isSeen.hashCode ^
        productId.hashCode;
  }

  String toJson() => json.encode(toMap());

  factory Chats.fromJson(String source) =>
      Chats.fromMap(json.decode(source) as Map<String, dynamic>);
}
