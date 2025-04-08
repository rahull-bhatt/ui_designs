import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_designs/skeleton_effects/aagyo_vendors/allorders_page.dart';
import 'package:ui_designs/skeleton_effects/aagyo_vendors/dashboard_home_skull.dart';
import 'package:ui_designs/skeleton_effects/aagyo_vendors/homepage_vendorapp_skeleton.dart';
import 'package:ui_designs/skeleton_effects/aagyo_vendors/manage_products_page.dart';
import 'package:ui_designs/skeleton_effects/aagyo_vendors/order_vendors_skeleton.dart';
import 'package:ui_designs/skeleton_effects/aagyo_vendors/ratings_vendorpageskull.dart';
import 'package:ui_designs/skeleton_effects/aagyo_vendors/store_details_skull.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AllOrdersPage(),
    );
  }
}
