import 'package:elmostaml/featuers/auth/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/routesname.dart';
import '../../../core/providers/valid.dart';
import '../../../utils.dart';
import '../controller/login_controller.dart';
import '../widgets/auth_button.dart';
import '../widgets/textfield.dart';
import 'forgetpassword_screen.dart';

class LoginScreen extends GetView<ImploginController> {
  void gotoSignup(BuildContext context) {
    Get.offNamed(AppRoutes.signup);
  }

  void gotoForgetPassword(BuildContext context) {
    Get.toNamed(AppRoutes.resetPassword);
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    Get.put(ImploginController());
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 439 * fem,
                    height: 343 * fem,
                    child: Image.asset(
                      'assets/page-1/images/ALMOSTAML-removebg-preview.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 18 * fem, vertical: 3 * fem),
                    child: TextFiledAuth(
                      controller: controller.email,
                      validator: (val) {
                        return validinput(val!, 8, 30, "");
                      },
                      name: "Email",
                      icon: 'assets/page-1/images/mdi-light-email-R9H.png',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 18 * fem, vertical: 3 * fem),
                    child: TextFiledAuth(
                      controller: controller.password,
                      validator: (val) {
                        return validinput(val!, 8, 30, "username");
                      },
                      ispassword: true,
                      name: "Password",
                      icon: 'assets/page-1/images/mdi-password-outline-6fR.png',
                    ),
                  ),
                  SizedBox(
                    height: 0 * fem,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => gotoForgetPassword(context),
                        child: Container(
                          // forgetpassword6B1 (2:164)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 10 * fem, 0 * fem),
                          child: Text(
                            'Forget Password ?',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.3252272606 * ffem / fem,
                              color: Color(0xff313030),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25 * fem,
                  ),
                  AuthButton(
                    ontap: () => controller.login(),
                    name: "Log in",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account? ',
                      ),
                      InkWell(
                        onTap: () => gotoSignup(context),
                        child: Text(
                          'Sign Up',
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 20 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.3252272606 * ffem / fem,
                            color: Color(0xff313030),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
