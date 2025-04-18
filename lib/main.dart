import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Scratch_card/homepage_scratchcard.dart';
import 'offline_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: OfflinePageUser(),
    );
  }
}
