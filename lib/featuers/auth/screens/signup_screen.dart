import 'package:elmostaml/HandlingDataView.dart';
import 'package:elmostaml/core/constants/routesname.dart';
import 'package:elmostaml/core/providers/valid.dart';
import 'package:elmostaml/featuers/auth/screens/login_screen.dart';
import 'package:elmostaml/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils.dart';
import '../controller/signup_controoler.dart';
import '../widgets/auth_button.dart';
import '../widgets/textfield.dart';

class SignupScreen extends StatelessWidget {
  void gotoLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    ImpsignupController controller = Get.put(ImpsignupController());
    return Scaffold(
        body: GetBuilder<ImpsignupController>(
            builder: (c) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Form(
                      key: controller.formstate,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                            23 * fem, 94 * fem, 23 * fem, 50 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                        ),
                        child: ListView(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () =>
                                      controller.pickimagefromGallery(context),
                                  child: controller.profileFile != null
                                      ? Padding(
                                          padding: EdgeInsets.fromLTRB(30 * fem,
                                              10 * fem, 26 * fem, 25 * fem),
                                          child: CircleAvatar(
                                              radius: 70,
                                              backgroundImage: FileImage(
                                                  controller.profileFile!)),
                                        )
                                      : Container(
                                          margin: EdgeInsets.fromLTRB(111 * fem,
                                              0 * fem, 111 * fem, 31 * fem),
                                          padding: EdgeInsets.fromLTRB(35 * fem,
                                              33 * fem, 26 * fem, 25 * fem),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color(0x7fc6b7b7),
                                            borderRadius:
                                                BorderRadius.circular(61 * fem),
                                          ),
                                          child: Center(
                                            // vectorxB9 (2:79)
                                            child: SizedBox(
                                              width: 61 * fem,
                                              height: 64 * fem,
                                              child: Image.asset(
                                                'assets/page-1/images/vector.png',
                                                width: 61 * fem,
                                                height: 64 * fem,
                                              ),
                                            ),
                                          ),
                                        ),
                                ),
                                TextFiledAuth(
                                    controller: controller.username,
                                    validator: (val) {
                                      return validinput(
                                          val!, 3, 30, "username");
                                    },
                                    name: "Name",
                                    icon:
                                        'assets/page-1/images/iconamoon-profile-thin-wmH.png'),
                                TextFiledAuth(
                                  controller: controller.email,
                                  validator: (val) {
                                    return validinput(val!, 8, 30, "");
                                  },
                                  name: "Email",
                                  icon:
                                      'assets/page-1/images/mdi-light-email-R9H.png',
                                ),
                                TextFiledAuth(
                                  controller: controller.phone,
                                  validator: (val) {
                                    return validinput(val!, 10, 30, "phone");
                                  },
                                  name: "Phone",
                                  icon:
                                      'assets/page-1/images/ph-phone-light-fUK.png',
                                ),
                                TextFiledAuth(
                                  controller: controller.password,
                                  validator: (val) {
                                    return validinput(val!, 6, 30, "username");
                                  },
                                  ispassword: true,
                                  name: "Password",
                                  icon:
                                      'assets/page-1/images/mdi-password-outline-6fR.png',
                                ),
                                AuthButton(
                                  ontap: () => controller.signup(),
                                  name: "Sign up",
                                ),
                                Container(
                                    // alreadyhaveanaccountsigninwPm (2:77)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 3 * fem, 0 * fem),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Already have an account? ',
                                        ),
                                        InkWell(
                                          onTap: () => gotoLogin(),
                                          child: Text(
                                            'Log In',
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
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )));
  }
}
