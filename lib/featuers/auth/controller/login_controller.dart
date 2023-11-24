import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elmostaml/featuers/auth/repositories/auth_repositories.dart';
import 'package:elmostaml/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constants/routesname.dart';
import '../../../core/constants/services/services.dart';
import '../../../core/providers/checkInternet.dart';

abstract class LoginController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  late StatusRequest statusRequest;
  MyServices myservices = Get.find();
  late GoogleSignInAccount? googleUser;
  AuthRepository authRepository = AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  );
}

class ImploginController extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool showpassword = true;

  login() async {
    var Formdata = formstate.currentState;
    if (Formdata!.validate()) {
      if (await checkInternet()) {
        statusRequest = StatusRequest.loading;
        update();
        final res =
            await authRepository.logIn(email.text.trim(), password.text);
        res.fold((l) => Get.snackbar("warning", "${l.toString()}"), (r) async {
          UserCredential userCredential = r;
          UserModel usermodel =
              await authRepository.getUserData(userCredential.user!.uid);
          myservices.sharedPreferences.setString("uid", usermodel.uid);
          myservices.sharedPreferences.setString("username", usermodel.name);
          myservices.sharedPreferences.setString("image", usermodel.profilePic);
          myservices.sharedPreferences.setString("phone", usermodel.phone);
          myservices.sharedPreferences.setString("step", "1");
          Get.offAllNamed(AppRoutes.homepage);
        });
      } else {
        statusRequest = StatusRequest.offlinefaliure;
      }
    }
    statusRequest = StatusRequest.success;
    update();
  }

  signout() {
    authRepository.logOut();
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.success;
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
