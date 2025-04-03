import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'home_page_skeleton.dart';
import 'orders_skeleton.dart';
class YourOrderSkeleton extends StatelessWidget {
  const YourOrderSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        titleSpacing: 0,
        leading: Icon(Icons.arrow_back_ios_new),
        title: Text(
          "YOUR ORDERS",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        shape: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: Colors.black12),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    commonStoreRowWidget(
                      useAllRadius: false,
                      topLeftRadius: 15,
                      topRightRadius: 15,
                      height: 75,
                    ),
                    SizedBox(height: 1),
                    commonStoreRowWidget(height: 72),
                    SizedBox(height: 1),
                    commonRowWidget(
                      height: 75,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            skeletonContainer(
                              height: 50,
                              width: 50,
                              radius: 10,
                            ),
                            SizedBox(width: 10),
                            skeletonContainer(
                              height: 50,
                              width: 50,
                              radius: 10,
                            ),
                            SizedBox(width: 10),
                            skeletonContainer(
                              height: 50,
                              width: 50,
                              radius: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 1),
                    commonRowWidget(
                      useAllRadius: false,
                      bottomLeftRadius: 15,
                      bottomRightRadius: 15,
                      height: 42,
                      child: Center(
                        child: skeletonContainer(
                          height: 18,
                          width: 90,
                          radius: 5,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
