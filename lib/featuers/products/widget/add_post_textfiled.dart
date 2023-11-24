import 'package:flutter/material.dart';

import '../../../core/providers/valid.dart';
import '../../../utils.dart';

class AddPostTextfield extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  AddPostTextfield({Key? key, required this.hintText, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
      child: TextFormField(
        controller: controller,
        validator: (val) {
          return validinput(val!, 1, 200, "usernamee");
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 3.0),
          hintText: hintText,
          hintStyle: SafeGoogleFont(
            'Inter',
            fontSize: 18 * ffem,
            height: size.height * 0.004,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(183, 141, 141, 141),
          ),
        ),
      ),
    );
  }
}
