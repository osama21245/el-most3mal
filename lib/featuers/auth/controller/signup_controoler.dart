// ignore_for_file: override_on_non_overriding_member

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elmostaml/core/providers/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/constants/routesname.dart';
import '../../../core/providers/checkInternet.dart';
import '../../../core/providers/storage_repository.dart';
import '../repositories/auth_repositories.dart';

abstract class SignupController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;
  late StatusRequest statusRequest;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  File? profileFile;
  AuthRepository authRepository = AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  );
  StorageRepository storageRepository =
      StorageRepository(firebaseStorage: FirebaseStorage.instance);
}

class ImpsignupController extends SignupController {
  @override
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool showpassword = true;

  _cropImage(String path) async {
    CroppedFile? croppedImage = await ImageCropper()
        .cropImage(sourcePath: path, maxHeight: 1080, maxWidth: 1080);
    return croppedImage;
  }

  pickimagefromGallery(BuildContext context) async {
    statusRequest = StatusRequest.loading;
    update();
    final res = await picImage();

    if (res != null) {
      profileFile = File(res.files.first.path!);
      update();
      // final image = await _cropImage(photo.path);
      // profileFile = File(image);
    }
    statusRequest = StatusRequest.success;
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    if (await checkInternet()) {
      if (profileFile == null) {
        Get.snackbar("!", "Add your photo");
      } else {
        final res = await storageRepository.storeFile(
            path: "user/photo", id: username.text, file: profileFile);
        String? profilepic;

        res.fold((l) => Get.snackbar("Warning", "${l.toString()}"), (r) async {
          final res = await authRepository.signinWithEmailAndPassword(
              email.text, password.text, username.text, phone.text, r);

          res.fold(
              (l) => Get.defaultDialog(
                  title: "Warning",
                  middleText: "Phone or Email is alredy Exist"),
              (r) => Get.offAllNamed(AppRoutes.login));
        });
      }

      statusRequest = StatusRequest.success;
      update();
    } else {
      statusRequest = StatusRequest.offlinefaliure;
    }
  }

  @override
  signup() async {
    var Formdata = formstate.currentState;
    if (Formdata!.validate()) {
      getData();
      print("Vaild");
    } else {
      print("not valid");
    }
  }

  @override
  gotologin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.success;
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
