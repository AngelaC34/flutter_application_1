// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uas_testing/screens/menus/faqpage.dart';
import 'package:flutter_uas_testing/screens/menus/aboutus.dart';
import 'package:flutter_uas_testing/screens/menus/contacts.dart';
import 'package:flutter_uas_testing/screens/settingscreens/profilesettings.dart';
import 'package:flutter_uas_testing/screens/signin.dart';
import 'package:flutter_uas_testing/utils/colors.dart';
import 'package:flutter_uas_testing/utils/universalvars.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../utils/sizes.dart';
import './myvoucherspage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
              top: TSizes.topPad,
              left: TSizes.leftPad,
              bottom: TSizes.botPad,
              right: TSizes.rightPad),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                    color: secondaryColor,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            top: 20.0, bottom: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2.0,
                              color: buttonhiglightColor,
                            ),
                            borderRadius: BorderRadius.circular(150.0)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(150.0),
                          child: Image.network(
                            photo,
                            fit: BoxFit.cover,
                            height: 70.0,
                            width: 70.0,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            username,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: secondaryColor,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            email,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: secondaryColor,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => Get.to(
                      () => const ProfileSettings(),
                    ),
                    icon: Icon(
                      Icons.settings,
                      color: buttonhiglightColor,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor,
                      blurRadius: 5.0,
                      spreadRadius: 0.0,
                      offset: const Offset(2.0, 2.0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    //MY ``VOUCHER``S
                    InkWell(
                      onTap: () => Get.to(
                        () => const MyVouchers(),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 220.0,
                            child: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.ticket,
                                  color: secondaryColor,
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'My Vouchers',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400,
                                    color: secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: buttonhiglightColor,
                          ),
                        ],
                      ),
                    ),

                    Divider(
                      thickness: 2.0,
                      color: borderColor,
                    ),

                    InkWell(
                      onTap: () => Get.to(
                        () => const FaqPage(),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 220.0,
                            child: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.circleInfo,
                                  color: secondaryColor,
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'FAQ',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400,
                                    color: secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: buttonhiglightColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor,
                      blurRadius: 5.0,
                      spreadRadius: 0.0,
                      offset: const Offset(2.0, 2.0),
                    ),
                  ],
                ),
                child: Column(children: [
                  //ABOUT US
                  InkWell(
                    onTap: () => Get.to(() => const AboutUsPage()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 220.0,
                          child: Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.heart,
                                color: secondaryColor,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                'About Us',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                  color: secondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: buttonhiglightColor,
                        ),
                      ],
                    ),
                  ),

                  Column(
                    children: [
                      Divider(
                        thickness: 2.0,
                        color: borderColor,
                      ),

                      //CONTACT US
                      InkWell(
                        onTap: () => Get.to(() => const ContactUs()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 220.0,
                              child: Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.message,
                                    color: secondaryColor,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Contact Us',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                      color: secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: buttonhiglightColor,
                            ),
                          ],
                        ),
                      ),

                      Divider(
                        thickness: 2.0,
                        color: borderColor,
                      ),

                      InkWell(
                        onTap: () {
                          signOut();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInPage()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 220.0,
                              child: Row(
                                children: [
                                  FaIcon(
                                    Icons.logout,
                                    color: secondaryColor,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Log Out',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                      color: secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: buttonhiglightColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("Logout berhasil");
    } catch (e) {
      print("Error saat logout: $e");
    }
  }
}