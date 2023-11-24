import 'package:flutter/material.dart';

import '../../../theme/pallete.dart';
import '../../../utils.dart';

class AuthButton extends StatelessWidget {
  void Function()? ontap;
  String name;
  AuthButton({Key? key, required this.name, this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30 * ffem,
        vertical: 9 * ffem,
      ),
      child: MaterialButton(
        onPressed: ontap,
        child: Text(
          name,
          style: SafeGoogleFont(
            'Inter',
            fontSize: 25 * ffem,
            fontWeight: FontWeight.w600,
            height: 1.3252272034 * ffem / fem,
            color: Color(0xffffffff),
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30 * fem)),
        color: Pallete.primaryColor,
        height: 56 * fem,
        minWidth: double.infinity,
      ),
    );
  }
}
