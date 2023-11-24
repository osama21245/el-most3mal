import 'package:elmostaml/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../utils.dart';

class ProductBubble extends StatelessWidget {
  ProductModel productModel;
  Size size;
  ProductBubble({Key? key, required this.productModel, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(68, 41, 1, 48),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(size.width * 0.1),
              bottomRight: Radius.circular(size.width * 0.1))),
      height: size.height * 0.3,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          productModel.images.first,
                        ))),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            // bicyclemountainZef (6:902)
                            '${productModel.productname}',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: size.width * 0.054,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000),
                            ),
                          ),
                          Text(
                            // bicyclemountainZef (6:902)
                            '    \$ ${productModel.productprice}',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: size.width * 0.033,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff000000),
                            ),
                          )
                        ],
                      ),
                      Row(
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
                              fontSize: size.width * 0.037,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${productModel.productDescription}',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person),
                Text(
                  // bicyclemountainZef (6:902)
                  '   ${productModel.username}',
                  style: SafeGoogleFont(
                    'Inter',
                    fontSize: size.width * 0.037,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff000000),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
