import 'package:elmostaml/core/constants/routesname.dart';
import 'package:elmostaml/core/constants/services/services.dart';
import 'package:elmostaml/featuers/auth/screens/login_screen.dart';
import 'package:elmostaml/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routemaster/routemaster.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils.dart';
import '../controller/splash_screen_controller.dart';

class SpashScreen extends GetView<ImpSplashScreenController> {
  @override
  Widget build(BuildContext context) {
    Get.put<ImpSplashScreenController>(ImpSplashScreenController());
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Container(
          // iphone1313pro1aXR (2:9)
          width: double.infinity,
          height: 844 * fem,
          decoration: BoxDecoration(
            color: Color(0xffeac0f3),
          ),
          child: Stack(
            children: [
              Positioned(
                // sellpurchaseorexchangeyouroldh (2:12)
                left: 36 * fem,
                top: 514 * fem,
                child: Align(
                  child: SizedBox(
                    width: 336 * fem,
                    height: 67 * fem,
                    child: Text(
                      'Sell, Purchase or Exchange your Old Home Appliannces',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 25 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.327715992 * ffem / fem,
                        color: Color(0xffc114e3),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // logo11BSf (2:32)
                left: -20 * fem,
                top: 176 * fem,
                child: Align(
                  child: SizedBox(
                    width: 439 * fem,
                    height: 343 * fem,
                    child: Image.asset(
                      'assets/page-1/images/ALMOSTAML-removebg-preview.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 280 * fem,
                top: 700 * fem,
                child: IconButton(
                    iconSize: fem * 70,
                    color: Pallete.primaryColor,
                    onPressed: () => controller.setSharedPref(),
                    icon: Icon(Icons.arrow_circle_right_outlined)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
