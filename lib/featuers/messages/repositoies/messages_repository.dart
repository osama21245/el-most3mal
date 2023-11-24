import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elmostaml/models/chat_model.dart';
import 'package:elmostaml/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/constants/firebase_constants.dart';

import '../../../core/faliure.dart';
import '../../../models/message_model.dart';
import '../../../models/user_model.dart';
import '../../../core/providers/firebase_providers.dart';

final messagesRepositoryProvider = Provider((ref) {
  return MessagesRepository(firestore: ref.watch(FirestoreProvider));
});

class MessagesRepository {
  final FirebaseFirestore _firestore;
  MessagesRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  CollectionReference get _messages => _firestore.collection("messages");

  int messages = 15;
  Stream<List<Message>> getMessages(String uid, String reciverid) {
    return _users
        .doc(uid)
        .collection("chats")
        .doc(reciverid)
        .collection("messages")
        .orderBy("timeSent", descending: true)
        .limit(messages)
        .snapshots()
        .map((event) {
      List<Message> chats = [];
      for (var document in event.docs) {
        chats.add(Message.fromMap(document.data()));
      }
      return chats;
    });
  }

  void loadMessages() {
    messages = messages + 10;
    print(messages);
  }

  _saveDateToChatsSubColletion(
    String senderId,
    String senderProfilepic,
    String senderName,
    UserModel reciverData,
    String text,
    String productid,
    DateTime timeSent,
  ) async {
    Chats reciverChatData = Chats(
        isSeen: true,
        name: reciverData.name,
        profilepic: reciverData.profilePic,
        contactId: reciverData.uid,
        timeSent: timeSent,
        lastMessage: text,
        productId: productid);

    await _users
        .doc(senderId)
        .collection("chats")
        .doc(reciverData.uid)
        .set(reciverChatData.toMap());

    Chats senderChatData = Chats(
        productId: productid,
        isSeen: false,
        name: senderName,
        profilepic: senderProfilepic,
        contactId: senderId,
        timeSent: timeSent,
        lastMessage: text);

    await _users
        .doc(reciverData.uid)
        .collection("chats")
        .doc(senderId)
        .set(senderChatData.toMap());
  }

  _savaDataToMessagesSubColletions(
      String reciverUserID,
      String text,
      DateTime timeSent,
      String messageId,
      String username,
      String senderID,
      String reciverUsername) async {
    Message message = Message(
        reciverUsername: reciverUsername,
        senderId: senderID,
        recieverid: reciverUserID,
        text: text,
        timeSent: timeSent,
        messageId: messageId,
        isSeen: false);

    await _users
        .doc(senderID)
        .collection("chats")
        .doc(reciverUserID)
        .collection("messages")
        .doc(messageId)
        .set(message.toMap());

    await _users
        .doc(reciverUserID)
        .collection("chats")
        .doc(senderID)
        .collection("messages")
        .doc(messageId)
        .set(message.toMap());
  }

  Future<Either> sendTextMessage(
      String text,
      String recieverUserId,
      String senderUid,
      String senderUsername,
      String senderProfilepic,
      String messageId,
      String productId) async {
    try {
      DateTime sentTime = DateTime.now();

      UserModel reciverUserData;

      var userDataMap =
          await _firestore.collection("users").doc(recieverUserId).get();

      reciverUserData = UserModel.fromMap(userDataMap.data()!);
      _saveDateToChatsSubColletion(senderUid, senderProfilepic, senderUsername,
          reciverUserData, text, productId, sentTime);
      return right(_savaDataToMessagesSubColletions(
        reciverUserData.uid,
        text,
        sentTime,
        messageId,
        senderUsername,
        senderUid,
        reciverUserData.name,
      ));
    } on FirebaseException catch (e) {
      throw e.toString();
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
