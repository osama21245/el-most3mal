import 'package:elmostaml/HandlingDataView.dart';
import 'package:elmostaml/featuers/products/controller/addproduct_controller.dart';
import 'package:elmostaml/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils.dart';
import '../widget/add_post_textfiled.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImpAddProductController controller = Get.put(ImpAddProductController());
    Size size = MediaQuery.of(context).size;
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back_ios_new_outlined)),
        ),
        body: GetBuilder<ImpAddProductController>(
            builder: (c) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(size.height * 0.035),
                      child: Form(
                        key: controller.formstate,
                        child: ListView(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Write item info",
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 26 * ffem,
                                  height: size.height * 0.000,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.04,
                            ),
                            AddPostTextfield(
                              hintText: "Enter Item Name",
                              controller: controller.productName,
                            ),
                            AddPostTextfield(
                              hintText: "Enter Item Price",
                              controller: controller.productprice,
                            ),
                            AddPostTextfield(
                              hintText: "Write Some Description",
                              controller: controller.productDescription,
                            ),
                            SizedBox(
                              height: size.height * 0.06,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Upload Photos",
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 26 * ffem,
                                  height: size.height * 0.001,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            Container(
                              height: size.height * 0.3,
                              width: size.width,
                              child: GridView.builder(
                                  itemCount: controller.pickedimages.length,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 0.54,
                                          crossAxisCount: 2),
                                  itemBuilder: (context, index) {
                                    return Image.file(
                                      controller.pickedimages[index],
                                    );
                                  }),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.007,
                                  horizontal: size.height * 0.1),
                              child: OutlinedButton(
                                onPressed: () =>
                                    controller.pickimagefromGallery(context),
                                child: Text(
                                  "Add Photo",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17),
                                ),
                                style: ElevatedButton.styleFrom(
                                  side: BorderSide(color: Colors.black),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                ),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () => controller.addProduct(),
                              child: Text(
                                "Upload",
                                style: TextStyle(
                                    color: Pallete.secoundaryColor,
                                    fontSize: 17),
                              ),
                              style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                      color: Pallete.secoundaryColor),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.140,
                                      vertical: size.height * 0.020)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )));
  }
}
