import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'home_page_skeleton.dart';
import 'other_skeletons.dart';

class StorePageMainSkeleton extends StatelessWidget {
  const StorePageMainSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        titleSpacing: 0,
        leading: Icon(Icons.arrow_back_ios_new),
        title: Text(
          "PARADISE HOTEL & RESTAURANT",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 12),
            height: 20,
            width: 39,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.green,
            ),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '5.0',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 1),
                  Icon(Icons.star, color: Colors.white, size: 12),
                ],
              ),
            ),
          ),
        ],
        shape: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: Colors.black12),
        ),
        backgroundColor: Colors.white,
      ),
      body: Shimmer.fromColors(
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[600]!,
        child: wholeStorePageView(),
      ),
    );
  }
}

Widget categorySkeletonStore({int? itemCount}) {
  return Align(
    alignment: AlignmentDirectional.topStart,
    child: ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount ?? 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: skeletonContainer(height: 60, width: 60, radius: 60,skullColor: false),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                child: skeletonContainer(height: 8, width: 45, radius: 2,skullColor: false),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget wholeStorePageView({int? itemCount}) {
  final wth = Get.size.width;
  return Row(
    children: [
      SizedBox(width: wth * 0.2, child: categorySkeletonStore()),
      Container(
        height: Get.size.height,
        width: 1.5,
        decoration: BoxDecoration(color: Colors.black38),
      ),
      SizedBox(width: 1),
      Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2),
          child: ListView(
            shrinkWrap: false,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                    child: skeletonContainer(
                      height: 45,
                      width: double.maxFinite,
                      radius: 13,skullColor: false
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: skeletonContainer(
                        height: 16,
                        width: 100,
                        radius: 3,skullColor: false
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 12, // Space between columns
                      // mainAxisSpacing: 45, // Space between rows
                      childAspectRatio: 0.5, // Width-to-height ratio
                    ),
                    itemCount: itemCount ?? 10, // Total number of items
                    itemBuilder: (context, index) {
                      return productSkeleton();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      SizedBox(width: 2),
    ],
  );
}
