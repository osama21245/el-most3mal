import 'package:elmostaml/featuers/messages/controller/messages_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/common/error_text.dart';
import '../../../core/common/loader.dart';
import '../../../core/constants/services/services.dart';
import '../../../core/enums/message_enum.dart';

import 'normal_messages_form.dart';

class MessageBubble extends ConsumerWidget {
  final String uid;
  ScrollController scrollController;
  MessageBubble({super.key, required this.uid, required this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    MyServices myservices = Get.find();

    return Expanded(
      child: ref.watch(getUserMessagesProviderr(uid)).when(
          data: (data) {
            return Container(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      reverse: true,
                      controller: scrollController,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final messages = data[index];
                        final timesent =
                            DateFormat.Hm().format(messages.timeSent);

                        return Align(
                            alignment: messages.senderId ==
                                    myservices.sharedPreferences
                                        .getString("uid")
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: NormalMessagesForm(
                              messages: messages,
                              timesent: timesent,
                            ));
                      })),
            );
          },
          error: (error, StackTrace) {
            print(error);
            ;
            return ErrorText(error: error.toString());
          },
          loading: () => const Loader()),
    );
  }
}
