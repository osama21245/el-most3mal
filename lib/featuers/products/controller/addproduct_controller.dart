import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elmostaml/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/constants/routesname.dart';
import '../../../core/constants/services/services.dart';
import '../../../core/providers/storage_repository.dart';
import '../../../core/providers/utils.dart';
import '../repositories/product_repositories.dart';

class AddProductController extends GetxController {
  late TextEditingController productName;
  late TextEditingController productDescription;
  late TextEditingController productprice;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  List<File> pickedimages = [];
  List<String> images = [];

  StorageRepository storageRepository =
      StorageRepository(firebaseStorage: FirebaseStorage.instance);
  late StatusRequest statusRequest;
  MyServices myservices = Get.find();
  ProductRepository productRepository = ProductRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  );
}

class ImpAddProductController extends AddProductController {
  void addProduct() async {
    var Formdata = formstate.currentState;

    if (Formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      String uid = myservices.sharedPreferences.getString("uid")!;
      String username = myservices.sharedPreferences.getString("username")!;
      String userimage = myservices.sharedPreferences.getString("image")!;
      String userphone = myservices.sharedPreferences.getString("phone")!;
      //Dont forget to update user location

      String productid = Uuid().v4();

      //store picked photos into firebase Storge
      for (var img in pickedimages) {
        String imgId = Uuid().v4();

        final res = await storageRepository.storeFile(
            path: "products", id: "$uid${imgId}", file: img);
        res.fold(
            (l) =>
                Get.rawSnackbar(title: "Warning", message: "${l.toString()}"),
            (r) => images.add(r));
      }
      String userLocation = "";
      Position position;
      // get user loction
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
      ].request();

      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark placemark = placemarks[0];
      userLocation = "${placemark.administrativeArea}, ${placemark.country}";
      if (statuses[Permission.location]!.isGranted) {
        if (images.length == pickedimages.length) {
          ProductModel productModel = ProductModel(
              id: productid,
              userid: uid,
              username: username,
              images: images,
              date: DateTime.now(),
              userimage: userimage,
              productname: productName.text,
              productprice: productprice.text,
              userLocation: userLocation,
              productDescription: productDescription.text,
              userPhone: userphone,
              lang: position.longitude,
              lat: position.latitude);
          final res = await productRepository.addProduct(productModel);

          res.fold((l) {
            Get.snackbar("Warning", "${l.toString()}");
          }, (r) {
            statusRequest = StatusRequest.success;
            Get.offAllNamed(AppRoutes.homepage);
          });
        }
      } else {
        Get.snackbar("!", "Dont have permission");
      }

      ;
    }
  }

  pickimagefromGallery(BuildContext context) async {
    statusRequest = StatusRequest.loading;
    update();
    final res = await picImage();

    if (res != null) {
      pickedimages.add(File(res.files.first.path!));
    }
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.success;
    productDescription = TextEditingController();
    productName = TextEditingController();
    productprice = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    productDescription.dispose();
    productName.dispose();
    productprice.dispose();
    super.dispose();
  }
}
