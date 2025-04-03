import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_designs/refer_and_earn_aagyo/refer_page_first_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReferEarnScreen(),
    );
  }
}
