// ignore_for_file: override_on_non_overriding_member, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elmostaml/featuers/auth/repositories/auth_repositories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/constants/routesname.dart';
import '../../../core/constants/services/services.dart';
import '../../../core/providers/checkInternet.dart';

abstract class SplashScreenController extends GetxController {
  late StatusRequest statusRequest;
  MyServices myservices = Get.find();
  late GoogleSignInAccount? googleUser;
}

class ImpSplashScreenController extends SplashScreenController {
  @override
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool showpassword = true;

  @override
  setSharedPref() async {
    myservices.sharedPreferences.setString("step", "1");
    Get.offNamed(AppRoutes.login);
  }
}
