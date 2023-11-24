import 'package:elmostaml/featuers/messages/controller/messages_controller.dart';
import 'package:elmostaml/theme/pallete.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MssagesTextField extends ConsumerStatefulWidget {
  TextEditingController message;
  ScrollController scrollController;
  FocusNode focusNode;
  String productId;
  String uid;
  MssagesTextField(
      {super.key,
      required this.productId,
      required this.uid,
      required this.message,
      required this.scrollController,
      required this.focusNode});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MssagesTextFieldState();
}

class _MssagesTextFieldState extends ConsumerState<MssagesTextField> {
  bool isShowEmojiContainer = false;
  bool isSountInit = false;
  bool? isRecord = false;

  void showEmoji() {
    setState(() {
      isShowEmojiContainer = true;
    });
  }

  void hideEmoji() {
    setState(() {
      isShowEmojiContainer = false;
    });
  }

  void hideKeyboard() => widget.focusNode.unfocus();
  void showKeyboard() => widget.focusNode.requestFocus();

  void toggleEmojiKeyboardContainer() {
    if (!isShowEmojiContainer) {
      hideKeyboard();
      showEmoji();
      print(isShowEmojiContainer);
    } else {
      hideEmoji();
      showKeyboard();
      print(isShowEmojiContainer);
    }
  }

  void sendMessage(
    BuildContext context,
  ) async {
    if (widget.message.text != "") {
      ref.watch(userProfileControllerProvider.notifier).sendText(
          widget.message.text.trim(), widget.uid, context, widget.productId);

      setState(() {
        widget.message.text = '';
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.scrollController
            .jumpTo(widget.scrollController.position.minScrollExtent);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  focusNode: widget.focusNode,
                  controller: widget.message,
                  onChanged: (val) {
                    if (val.isNotEmpty) {
                      setState(() {});
                    } else {
                      setState(() {});
                    }
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () => sendMessage(context),
                        icon: Icon(Icons.send, color: Colors.white)),
                    filled: true,
                    fillColor: Color.fromARGB(68, 41, 1, 48),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                        width: size.width * 0.14,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: toggleEmojiKeyboardContainer,
                              icon: const Icon(
                                Icons.emoji_emotions,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    hintText: 'Type a message!',
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                ),
              ),
            ],
          ),
          isShowEmojiContainer
              ? SizedBox(
                  height: size.height * 0.32,
                  child: EmojiPicker(
                    onEmojiSelected: (category, emoji) {
                      setState(() {
                        widget.message.text = widget.message.text + emoji.emoji;
                      });
                    },
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
