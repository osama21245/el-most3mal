import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool swith = false;
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: SafeArea(
          child: Column(
        children: [
          CircleAvatar(
            backgroundImage:
                AssetImage("assets/page-1/images/rectangle-SSb.png"),
          ),
          Text(
            'Esraa',
            style: SafeGoogleFont(
              'Josefin Sans',
              fontSize: 20 * ffem,
              fontWeight: FontWeight.w500,
              height: 1.2550000191 * ffem / fem,
              color: Color(0xff000000),
            ),
          ),
          Text(
            'esraaabdou33@gmail.com',
            style: SafeGoogleFont(
              'Josefin Sans',
              fontSize: 15 * ffem,
              fontWeight: FontWeight.w400,
              height: 1.2550000509 * ffem / fem,
              color: Color(0xff000000),
            ),
          ),
          SwitchListTile(
            value: swith,
            onChanged: (swith) {},
            title: Text(
              'Dark Mode',
              style: SafeGoogleFont(
                'Josefin Sans',
                fontSize: 20 * ffem,
                fontWeight: FontWeight.w500,
                height: 1.2550000191 * ffem / fem,
                color: Color(0xff716d6d),
              ),
            ),
          ),
          ListTile(
              leading: Icon(Icons.person_outline_outlined),
              title: Text(
                'Account',
                style: SafeGoogleFont(
                  'Josefin Sans',
                  fontSize: 20 * ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.2550000191 * ffem / fem,
                  color: Color(0xff716d6d),
                ),
              )),
          ListTile(
              leading: Icon(Icons.language),
              title: Text(
                'Language',
                style: SafeGoogleFont(
                  'Josefin Sans',
                  fontSize: 20 * ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.2550000191 * ffem / fem,
                  color: Color(0xff716d6d),
                ),
              )),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                'Logout',
                style: SafeGoogleFont(
                  'Josefin Sans',
                  fontSize: 20 * ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.2550000191 * ffem / fem,
                  color: Color(0xff716d6d),
                ),
              ))
        ],
      )),
    );
  }
}
