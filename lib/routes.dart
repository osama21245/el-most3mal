import 'package:elmostaml/featuers/auth/screens/forgetpassword_screen.dart';
import 'package:elmostaml/featuers/auth/screens/login_screen.dart';
import 'package:elmostaml/featuers/auth/screens/signup_screen.dart';
import 'package:get/get.dart';

import 'core/constants/routesname.dart';
import 'core/middleWare/myMiddleWare.dart';
import 'featuers/home/screens/home_screen.dart';
import 'featuers/products/screens/add_products_screen.dart';
import 'featuers/products/screens/product_details_screnn.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => HomeScreen(), middlewares: [myMiddlware()]),
  GetPage(name: AppRoutes.login, page: () => LoginScreen()),
  GetPage(name: AppRoutes.signup, page: () => SignupScreen()),
  GetPage(name: AppRoutes.resetPassword, page: () => ForgetPassword()),
  GetPage(name: AppRoutes.homepage, page: () => HomeScreen()),
  GetPage(name: AppRoutes.addproduct, page: () => AddProductScreen()),
  // GetPage(name: AppRoutes.productdetails, page: () => ProductDetailsScreen(productModel: null,)),
];
