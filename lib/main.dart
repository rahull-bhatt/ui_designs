import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_designs/refer_and_earn_aagyo/refer_page_first_screen.dart';
import 'package:ui_designs/skeleton_effects/aagyo_customers/cart_skeleton.dart';
import 'package:ui_designs/skeleton_effects/aagyo_customers/home_page_skeleton.dart';
import 'package:ui_designs/skeleton_effects/aagyo_customers/orders_skeleton.dart';
import 'package:ui_designs/skeleton_effects/aagyo_customers/other_skeletons.dart';
import 'package:ui_designs/skeleton_effects/aagyo_customers/single_store_skeleton.dart';
import 'package:ui_designs/skeleton_effects/aagyo_customers/store_mainpage_skeleton.dart';
import 'package:ui_designs/skeleton_effects/aagyo_customers/your_orderskeleton.dart';
import 'package:ui_designs/skeleton_effects/aagyo_vendors/order_transaction_skeleton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: YourOrderSkeleton(),
    );
  }
}
