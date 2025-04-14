import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'all_common_widgets.dart';
import 'manage_products_page.dart';

class ProductHomepageSkeleton extends StatelessWidget {
  const ProductHomepageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    double wth = Get.size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 85,
        surfaceTintColor: Colors.white,
        titleSpacing: 0,
        leading: Icon(Icons.arrow_back_ios_new),
        title: Text(
          "Store is Open",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        shape: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: Colors.black12),
        ),
        backgroundColor: Colors.white,
      ),
      body: Shimmer.fromColors(
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[600]!,
        child: Row(
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
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  shrinkWrap: false,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: skeletonContainer(
                            height: 150,
                            width: double.maxFinite,
                            radius: 13,
                            skullColor: false,
                          ),
                        ),
                        skeletonContainer(
                          height: 45,
                          width: double.maxFinite,
                          radius: 8,
                          skullColor: false,
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: skeletonContainer(
                              height: 20,
                              width: 100,
                              radius: 3,
                              skullColor: false,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, // Number of columns
                                crossAxisSpacing: 14, // Space between columns
                                // mainAxisSpacing: 45, // Space between rows
                                childAspectRatio: 0.4, // Width-to-height ratio
                              ),
                          itemCount: 10, // Total number of items
                          itemBuilder: (context, index) {
                            return manageProductSkull();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
