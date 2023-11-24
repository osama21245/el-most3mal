import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/pallete.dart';
import '../../../utils.dart';

class TextFiledAuth extends ConsumerWidget {
  String name;
  String icon;
  bool? ispassword;
  String? Function(String?)? validator;
  TextEditingController controller;
  TextFiledAuth(
      {super.key,
      required this.name,
      required this.icon,
      this.ispassword,
      required this.controller,
      this.validator});
  bool showAndHidePass = false;
  void changestate() {
    showAndHidePass = !showAndHidePass!;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      // autogroupcrbmUQP (7HhzvaJPgFXRdyTAszcRbm)
      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 16 * fem),
      padding: EdgeInsets.fromLTRB(13.5 * fem, 0 * fem, 21 * fem, 0 * fem),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffe4e0e0),
        borderRadius: BorderRadius.circular(30 * fem),
      ),
      child: Container(
        // iconamoonprofilethinZRq (2:49)

        child: StatefulBuilder(
          builder: (BuildContext context, setState) {
            return TextFormField(
              controller: controller,
              validator: validator,
              obscureText: showAndHidePass,
              decoration: InputDecoration(
                suffixIcon: ispassword == null
                    ? null
                    : InkWell(
                        onTap: () {
                          changestate();
                          print("sss");
                          setState(() {});
                        },
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                        ),
                      ),
                border: OutlineInputBorder(borderSide: BorderSide.none),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(13.63 * fem),
                  child: Image.asset(
                    icon,
                    width: 1.63 * fem,
                    height: 1.13 * fem,
                  ),
                ),
                hintText: name,
                hintStyle: SafeGoogleFont(
                  'Inter',
                  fontSize: 20 * ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.3252272606 * ffem / fem,
                  color: Color(0xff6f6f6f),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
