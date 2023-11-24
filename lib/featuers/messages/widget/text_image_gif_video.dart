import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/message_model.dart';

class Text_Image_Video_Gif extends ConsumerWidget {
  Message messages;
  String timesent;
  Text_Image_Video_Gif(
      {Key? key, required this.messages, required this.timesent})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    bool isplayRecord = false;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: Text(
            messages.text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              messages.isSeen
                  ? Icon(
                      Icons.done_all,
                      size: 12,
                    )
                  : Icon(
                      Icons.done,
                      size: 12,
                    ),
              Text(
                timesent,
                style: TextStyle(
                    fontSize: 6, color: Color.fromARGB(218, 153, 182, 206)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
