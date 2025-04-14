import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Scratch_card/homepage_scratchcard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomepageScratchcard(),
    );
  }
}
