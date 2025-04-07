import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ui_designs/skeleton_effects/aagyo_customers/home_page_skeleton.dart';
import 'package:ui_designs/skeleton_effects/aagyo_customers/orders_skeleton.dart';

class OrderDetailsSkeleton extends StatelessWidget {
  const OrderDetailsSkeleton({super.key});

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
        highlightColor: Colors.grey[500]!,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              commonRowWidget(
                useAllRadius: true,
                height: 110,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          skeletonContainer(height: 20, width: 90, radius: 5),
                          Spacer(),
                          skeletonContainer(height: 20, width: 40, radius: 8),
                        ],
                      ),
                      SizedBox(height: 10),
                      skeletonContainer(height: 12, width: 70, radius: 4),
                      SizedBox(height: 10),
                      skeletonContainer(height: 12, width: 130, radius: 4),
                      SizedBox(height: 10),
                      skeletonContainer(height: 15, width: 200, radius: 4),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              commonStoreRowWidget(
                useAllRadius: false,
                topRightRadius: 10,
                topLeftRadius: 10,
              ),

              SizedBox(height: 1),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return commonStoreRowWidget(useAllRadius: false);
                },
              ),
              SizedBox(height: 1),
              commonStoreRowWidget(
                useAllRadius: false,
                bottomRightRadius: 10,
                bottomLeftRadius: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


