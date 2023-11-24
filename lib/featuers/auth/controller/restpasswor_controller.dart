// ignore_for_file: override_on_non_overriding_member, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constants/routesname.dart';
import '../../../core/constants/services/services.dart';
import '../../../core/providers/checkInternet.dart';
import '../repositories/auth_repositories.dart';

abstract class RestPasswordController extends GetxController {
  late TextEditingController email;
  late StatusRequest statusRequest;
  MyServices myservices = Get.find();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  AuthRepository authRepository = AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  );
}

class ImpRestPasswordController extends RestPasswordController {
  @override
  restPassword() async {
    statusRequest = StatusRequest.loading;
    update();
    if (await checkInternet()) {
      var Formdata = await formstate.currentState;
      final res = await authRepository.restPassword(email.text);
      res.fold((l) => Get.snackbar("Warning", "${l.toString()}"),
          (r) => Get.offAllNamed(AppRoutes.login));
    } else {
      StatusRequest.offlinefaliure;
    }
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.success;
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
