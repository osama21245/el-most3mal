import 'package:elmostaml/core/constants/routesname.dart';
import 'package:elmostaml/featuers/home/controller/home_controller.dart';
import 'package:elmostaml/featuers/home/controller/viewPosts_controller.dart';
import 'package:elmostaml/featuers/home/widgets/product_card.dart';
import 'package:elmostaml/featuers/products/screens/product_details_screnn.dart';
import 'package:elmostaml/models/product_model.dart';
import 'package:elmostaml/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/common/error_text.dart';
import '../../../core/common/loader.dart';
import '../../../core/providers/valid.dart';
import '../../../utils.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    ImpHomeController controller = Get.put(ImpHomeController());
    double ffem = fem * 0.97;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Get.toNamed(AppRoutes.addproduct),
        child: Icon(
          size: size.height * 0.04,
          Icons.cloud_upload_outlined,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.02, left: size.height * 0.01),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/page-1/images/logo1-1-5sV.png"),
                  ),
                  Text(
                    "ELMOSTAML",
                    style: SafeGoogleFont(
                      'Audiowide',
                      fontSize: size.height * 0.022,
                      fontWeight: FontWeight.w600,
                      color: Pallete.secoundaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.location_on_sharp,
                      color: Colors.black,
                    )),
                Text(
                  "Alexandria, Egypt",
                  style: SafeGoogleFont('Inter',
                      fontSize: size.height * 0.02,
                      fontWeight: FontWeight.bold,
                      height: size.height * 0.001),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/page-1/images/jam-menu.png",
                    ))
                // IconButton(
                //     onPressed: () {},
                //     icon: Icon(
                //       Icons.menu,
                //     ))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.0001),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.height * 0.025),
                      child: Container(
                        // rectangle5v4o (4:437)

                        width: double.infinity,
                        height: 50 * fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15 * fem),
                          color: Color.fromARGB(111, 214, 214, 214),
                        ),
                        child: TextFormField(
                          validator: (val) {
                            return validinput(val!, 8, 50, "username");
                          },
                          decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            prefixIcon: Icon(
                              Icons.search,
                              size: size.height * 0.03,
                            ),
                            hintText: "Find your need",
                            hintStyle: SafeGoogleFont(
                              'Inter',
                              fontSize: 18 * ffem,
                              height: size.height * 0.001,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(183, 141, 141, 141),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        color: Pallete.secoundaryColor,
                      ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.height * 0.03,
                  vertical: size.height * 0.025),
              child: Container(
                  width: size.width,
                  height: size.height * 0.7,
                  child: ref.watch(viewPostsProvider).when(
                        data: (post) => ListView.builder(
                            itemCount: post.length,
                            itemBuilder: (context, index) {
                              var posts = post[index];

                              final timesent =
                                  DateFormat.yMMMMEEEEd().format(posts.date);

                              return InkWell(
                                onTap: () {
                                  Get.to(() => ProductDetailsScreen(
                                      productModel: posts));
                                },
                                child: ProductCard(
                                    userimage: posts.userimage,
                                    username: posts.username,
                                    productname: posts.productname,
                                    timesent: timesent,
                                    productimage: posts.images.first),
                              );
                            }),
                        error: (error, StackTrace) {
                          print(error);
                          ;
                          return ErrorText(error: error.toString());
                        },
                        loading: () => const Loader(),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
