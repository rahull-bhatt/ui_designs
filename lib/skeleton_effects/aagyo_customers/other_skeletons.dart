import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'home_page_skeleton.dart';

class StoreWithProductSkeleton extends StatelessWidget {
  const StoreWithProductSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(toolbarHeight: 110, backgroundColor: Colors.black12, surfaceTintColor: Colors.transparent,),
      body: Shimmer.fromColors(
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[600]!,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return storeSkeleton(scrollDirection: false);
            },
          ),
        ),
      ),
    );
  }
}

Widget productSkeleton() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      skeletonContainer(height: 130, width: 130, radius: 12, skullColor: false),

      SizedBox(height: 15),

      skeletonContainer(height: 10, width: 20, radius: 2, skullColor: false),
      SizedBox(height: 8),
      skeletonContainer(height: 10, width: 70, radius: 2, skullColor: false),
      SizedBox(height: 8),
      skeletonContainer(height: 10, width: 60, radius: 2, skullColor: false),
      SizedBox(height: 8),
      skeletonContainer(height: 10, width: 20, radius: 2, skullColor: false),
    ],
  );
}

Widget storeSkeleton({bool scrollDirection = true}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          skeletonContainer(
            height: 40,
            width: 40,
            radius: 5,
            skullColor: false,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              skeletonContainer(
                height: 15,
                width: 200,
                radius: 3,
                skullColor: false,
              ),
              SizedBox(height: 5),
              skeletonContainer(
                height: 15,
                width: 50,
                radius: 3,
                skullColor: false,
              ),
            ],
          ),
        ],
      ),

      SizedBox(height: 15),

      SizedBox(
        height: 285, // Increased height to accommodate text containers
        child: ListView.builder(
          scrollDirection:
              scrollDirection == true ? Axis.vertical : Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 12),
              child: productSkeleton(),
            );
          },
        ),
      ),
    ],
  );
}
