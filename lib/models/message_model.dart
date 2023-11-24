// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../core/enums/message_enum.dart';

class Message {
  final String senderId;
  final String recieverid;
  final String text;
  final DateTime timeSent;
  final String messageId;
  final bool isSeen;

  final String reciverUsername;

  Message({
    required this.senderId,
    required this.recieverid,
    required this.text,
    required this.timeSent,
    required this.messageId,
    required this.isSeen,
    required this.reciverUsername,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'recieverid': recieverid,
      'text': text,
      'timeSent': timeSent.millisecondsSinceEpoch,
      'messageId': messageId,
      'isSeen': isSeen,
      'reciverUsername': reciverUsername,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      senderId: map['senderId'] as String,
      recieverid: map['recieverid'] as String,
      text: map['text'] as String,
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent'] as int),
      messageId: map['messageId'] as String,
      isSeen: map['isSeen'] as bool,
      reciverUsername: map['reciverUsername'] as String,
    );
  }

  Message copyWith({
    String? senderId,
    String? recieverid,
    String? text,
    DateTime? timeSent,
    String? messageId,
    bool? isSeen,
    String? reciverUsername,
  }) {
    return Message(
      senderId: senderId ?? this.senderId,
      recieverid: recieverid ?? this.recieverid,
      text: text ?? this.text,
      timeSent: timeSent ?? this.timeSent,
      messageId: messageId ?? this.messageId,
      isSeen: isSeen ?? this.isSeen,
      reciverUsername: reciverUsername ?? this.reciverUsername,
    );
  }

  @override
  String toString() {
    return 'Message(senderId: $senderId, recieverid: $recieverid, text: $text, timeSent: $timeSent, messageId: $messageId, isSeen: $isSeen, reciverUsername: $reciverUsername)';
  }

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;

    return other.senderId == senderId &&
        other.recieverid == recieverid &&
        other.text == text &&
        other.timeSent == timeSent &&
        other.messageId == messageId &&
        other.isSeen == isSeen &&
        other.reciverUsername == reciverUsername;
  }

  @override
  int get hashCode {
    return senderId.hashCode ^
        recieverid.hashCode ^
        text.hashCode ^
        timeSent.hashCode ^
        messageId.hashCode ^
        isSeen.hashCode ^
        reciverUsername.hashCode;
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source) as Map<String, dynamic>);
}
