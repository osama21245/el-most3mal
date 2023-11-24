import 'package:elmostaml/featuers/messages/repositoies/messages_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../../../core/constants/services/services.dart';
import '../../../models/message_model.dart';
import '../../../core/providers/storage_repository.dart';
import '../../../core/utils.dart';

final userProfileControllerProvider =
    StateNotifierProvider<UserProfileController, bool>((ref) {
  final messagesRepository = ref.watch(messagesRepositoryProvider);
  final storageRepository = ref.watch(storageRepositoryProvider);
  return UserProfileController(
    messagesRepository: messagesRepository,
    storageRepository: storageRepository,
    ref: ref,
  );
});

final getUserMessagesProviderr = StreamProvider.family((ref, String uid) {
  return ref.watch(userProfileControllerProvider.notifier).getMessages(uid);
});

class UserProfileController extends StateNotifier<bool> {
  final MessagesRepository _messagesRepository;
  final Ref _ref;
  final StorageRepository _storageRepository;
  UserProfileController({
    required MessagesRepository messagesRepository,
    required Ref ref,
    required StorageRepository storageRepository,
  })  : _messagesRepository = messagesRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(false);

  Stream<List<Message>> getMessages(String uid) {
    MyServices myservices = Get.find();

    final curr = myservices.sharedPreferences.getString("uid");
    return _messagesRepository.getMessages(curr!, uid);
  }

  void sendText(String text, String reciverUserId, BuildContext context,
      String productId) async {
    MyServices myservices = Get.find();
    String? senderUid = myservices.sharedPreferences.getString("uid");
    String? senderUsername = myservices.sharedPreferences.getString("username");
    String? senderProfilePic = myservices.sharedPreferences.getString("image");

    final res = await _messagesRepository.sendTextMessage(text, reciverUserId,
        senderUid!, senderUsername!, senderProfilePic!, Uuid().v1(), productId);
    res.fold((l) => showSnackBar(l.message, context), (r) => null);
  }
}
