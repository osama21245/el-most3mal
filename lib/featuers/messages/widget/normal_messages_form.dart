import 'package:elmostaml/core/constants/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../models/message_model.dart';
import 'text_image_gif_video.dart';

class NormalMessagesForm extends ConsumerWidget {
  Message messages;
  String timesent;
  NormalMessagesForm(
      {super.key, required this.messages, required this.timesent});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    MyServices myServices = Get.find();
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5),
        constraints: BoxConstraints(maxWidth: size.width * 0.66),
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(158, 93, 6, 146)),
          borderRadius: BorderRadius.circular(20),
          color:
              messages.senderId == myServices.sharedPreferences.getString("uid")
                  ? null
                  : Color.fromARGB(158, 176, 61, 187),
        ),
        child: Text_Image_Video_Gif(
          messages: messages,
          timesent: timesent,
        ));
  }
}
