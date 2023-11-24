import 'package:elmostaml/HandlingDataView.dart';
import 'package:elmostaml/featuers/auth/controller/restpasswor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/providers/valid.dart';
import '../../../utils.dart';
import '../widgets/auth_button.dart';
import '../widgets/textfield.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    ImpRestPasswordController controller = Get.put(ImpRestPasswordController());
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<ImpRestPasswordController>(
            builder: (c) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Form(
                    key: controller.formstate,
                    child: Container(
                      width: double.infinity,
                      child: Container(
                        // iphone1313pro6o6f (4:434)
                        padding: EdgeInsets.fromLTRB(
                            23 * fem, 62.8 * fem, 22.93 * fem, 1 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                        ),
                        child: ListView(
                          children: [
                            Container(
                              // forgotpasswordamico1JZD (4:720)
                              margin: EdgeInsets.fromLTRB(
                                  23.93 * fem, 0 * fem, 0 * fem, 22.24 * fem),
                              width: 282.71 * fem,
                              height: 263.95 * fem,
                              child: Image.asset(
                                'assets/page-1/images/forgot-password-amico-1.png',
                                width: 282.71 * fem,
                                height: 263.95 * fem,
                              ),
                            ),
                            Container(
                              // emailaddressCuV (4:439)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 210.07 * fem, 16.41 * fem),
                              child: Text(
                                'Email address',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.3252272606 * ffem / fem,
                                  color: Color(0xff3d3d3d),
                                ),
                              ),
                            ),
                            Container(
                              // rectangle5v4o (4:437)
                              margin: EdgeInsets.fromLTRB(
                                  0.07 * fem, 0 * fem, 0 * fem, 71.59 * fem),
                              width: double.infinity,
                              height: 60 * fem,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15 * fem),
                                color: Color(0x72b7a1a1),
                              ),
                              child: TextFormField(
                                controller: controller.email,
                                validator: (val) {
                                  return validinput(val!, 8, 50, "username");
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: "",
                                  hintStyle: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.3252272606 * ffem / fem,
                                    color: Color(0xff6f6f6f),
                                  ),
                                ),
                              ),
                            ),
                            AuthButton(
                              name: "Rest Now",
                              ontap: () => controller.restPassword(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )));
  }
}
