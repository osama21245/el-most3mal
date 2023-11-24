import 'package:carousel_slider/carousel_slider.dart';
import 'package:elmostaml/featuers/messages/screens/messages_screen.dart';
import 'package:elmostaml/models/product_model.dart';
import 'package:elmostaml/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductModel productModel;
  ProductDetailsScreen({Key? key, required this.productModel})
      : super(key: key);

  checkLocation(double long, double lat) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
    ].request();
    if (statuses[Permission.location]!.isGranted) {
      String url = "https://www.google.com/maps/search/?api=1&query=$lat,$long";
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        Get.snackbar("!", "Could not open the map");
      }
    } else {
      Get.snackbar("!", "Dont have permission");
    }

    ;
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            // bicyclemountainZef (6:902)
            '${productModel.productname}',
            style: SafeGoogleFont(
              'Inter',
              fontSize: 22 * ffem,
              fontWeight: FontWeight.w600,
              color: Color(0xff000000),
            ),
          ),
          leading: IconButton(
              onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
        ),
        body: Padding(
          padding: EdgeInsets.all(size.width * 0.035),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CarouselSlider(
                items: productModel.images
                    .map(
                      (e) => ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network("$e"),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  height: size.height * 0.25,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ' \$ ${productModel.productprice}',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 28 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.3252272288 * ffem / fem,
                        color: Pallete.secoundaryColor,
                      ),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        color: Pallete.secoundaryColor,
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: size.height * 0.01,
                    bottom: size.height * 0.016,
                    top: size.height * 0.006),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    // bicyclemountainZef (6:902)
                    '${productModel.productname}',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 21 * ffem,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: size.height * 0.01, bottom: size.height * 0.033),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/page-1/images/frame-6.png",
                      width: size.width * 0.03,
                    ),
                    Text(
                      // bicyclemountainZef (6:902)
                      '   ${productModel.userLocation}',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 21 * ffem,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '${productModel.productDescription}',
                style: SafeGoogleFont(
                  'Inter',
                  fontSize: 18 * ffem,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(
                  thickness: 2,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.007,
                  ),
                  Image.asset("assets/page-1/images/prodetailsphone.png",
                      width: size.width * 0.064),
                  SizedBox(
                    width: size.width * 0.007,
                  ),
                  Text(
                    '${productModel.userPhone}',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.5202273369 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () => Get.to(
                          () => MessagesScreen(productModel: productModel)),
                      icon: Icon(
                        Icons.message_outlined,
                        color: Pallete.blueColor,
                      ))
                ],
              ),
              Spacer(),
              MaterialButton(
                padding: EdgeInsets.all(size.height * 0.014),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () =>
                    checkLocation(productModel.lang, productModel.lat),
                child: Text(
                  'Check Seller Location',
                  style: SafeGoogleFont(
                    'Inter',
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.5202273369 * ffem / fem,
                    color: Colors.white,
                  ),
                ),
                color: Pallete.secoundaryColor,
              )
            ],
          ),
        ));
  }
}
