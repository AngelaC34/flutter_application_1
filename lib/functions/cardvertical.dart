// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:flutter_uas_testing/utils/colors.dart';
import 'package:get/get.dart';
import '../functions/gridmaker.dart';
import '../screens/popups/popupdiscovery.dart';

class CardVertical extends StatelessWidget {
  const CardVertical({super.key, required this.gridItems});
  final GridItems gridItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
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
          const SizedBox(
            height: 8.0,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: InkWell(
              onTap: () => Get.to(
                () => PopUpDiscovery(
                  gridItems: this.gridItems,
                ),
              ),
              child: Image.asset(
                gridItems.imageUrl,
                fit: BoxFit.cover,
                height: 150.0,
                width: 180.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(1.0),
            alignment: Alignment.center,
            child: Text(
              gridItems.gridName,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}