import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elmostaml/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constants/services/services.dart';
import '../../auth/repositories/auth_repositories.dart';
import '../../products/repositories/product_repositories.dart';

class HomeController extends GetxController {
  late StatusRequest statusRequest;
  MyServices myservices = Get.find();
  // List<ProductModel> products = [];
  ProductRepository productRepository = ProductRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  );
  AuthRepository authRepository = AuthRepository(
      auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance);
}

class ImpHomeController extends HomeController {
  // getProductsStream2() {
  //   products = productRepository.getproducts2() as List<ProductModel>;
  // }

  Stream<List<ProductModel>> getProductsStream() {
    return productRepository.getProductsStream3();
  }

  logOut() async {
    authRepository.logOut();
    myservices.sharedPreferences.setString("step", "1");
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.success;
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
