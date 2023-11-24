// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../utils.dart';

class ProductCard extends StatelessWidget {
  String userimage;
  String username;
  String productname;
  String timesent;
  String productimage;
  ProductCard({
    Key? key,
    required this.userimage,
    required this.username,
    required this.productname,
    required this.timesent,
    required this.productimage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.008,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.height * 0.006,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1.3),
        ),
        width: size.width,
        height: size.height * 0.175,
        child: Row(
          children: [
            Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.005,
                      vertical: size.height * 0.010),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: size.width * 0.03,
                            backgroundImage: NetworkImage(
                              userimage,
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            username,
                            style: SafeGoogleFont('Inter',
                                fontSize: size.height * 0.017,
                                fontWeight: FontWeight.bold,
                                height: size.height * 0.002),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: size.width * 0.029,
                            horizontal: size.height * 0.01),
                        child: Text(
                          productname,
                          style: SafeGoogleFont('Inter',
                              fontSize: size.height * 0.0153,
                              fontWeight: FontWeight.w700,
                              height: size.height * 0.001),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.height * 0.005),
                        child: Text(
                          timesent, //"12 may 2023 - 15:02 PM"
                          style: SafeGoogleFont('Inter',
                              fontSize: size.height * 0.012,
                              fontWeight: FontWeight.w600,
                              height: size.height * 0.001,
                              color: const Color.fromARGB(255, 136, 136, 136)),
                        ),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.009),
              child: Container(
                height: size.height * 0.136,
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(
                            width: 1.2,
                            color: Color.fromARGB(255, 153, 153, 153)))),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.01),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    productimage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
