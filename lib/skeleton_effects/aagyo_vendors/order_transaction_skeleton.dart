import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ui_designs/skeleton_effects/aagyo_customers/orders_skeleton.dart';

class OrderTransactionSkeleton extends StatelessWidget {
  const OrderTransactionSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        titleSpacing: 0,
        leading: Icon(Icons.arrow_back_ios_new),
        title: Text(
          "Order Transaction",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        shape: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: Colors.black12),
        ),
        backgroundColor: Colors.white,
      ),
      body: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context,index){return commonStoreRowWidget(useAllRadius: true);}),
      ),
    );
  }
}
