import 'package:elmostaml/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../utils.dart';
import '../widget/TextField.dart';
import '../widget/messges.dart';
import '../widget/product_bubble.dart';

class MessagesScreen extends ConsumerStatefulWidget {
  final ProductModel productModel;

  const MessagesScreen({Key? key, required this.productModel})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends ConsumerState<MessagesScreen> {
  bool isloading = false;
  final message = TextEditingController();
  ScrollController scrollController = ScrollController();
  FocusNode focusNode = FocusNode();

  // @override
  // void dispose() {
  //   message.dispose();
  //   scrollController.dispose();
  //   super.dispose();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   scrollController.addListener(() {
  //     // if (scrollController.position.atEdge &&
  //     //     !scrollController.position.pixels.isNegative) {
  //     //   ref.watch(userProfileControllerProvider.notifier).loadMessages();
  //     //   setState(() {});
  //     //   print("done");
  //     // }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: InkWell(
          onTap: () {
            focusNode.unfocus();
          },
          child: Column(
            children: [
              ProductBubble(
                productModel: widget.productModel,
                size: size,
              ),
              MessageBubble(
                scrollController: scrollController,
                uid: widget.productModel.userid,
              ),
              MssagesTextField(
                productId: widget.productModel.id,
                uid: widget.productModel.userid,
                focusNode: focusNode,
                message: message,
                scrollController: scrollController,
              )
            ],
          ),
        ),
      ),
    );
  }
}
