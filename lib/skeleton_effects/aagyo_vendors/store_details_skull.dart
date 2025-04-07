import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ui_designs/skeleton_effects/aagyo_customers/home_page_skeleton.dart';
import 'package:ui_designs/skeleton_effects/aagyo_customers/orders_skeleton.dart';

class StoreDetailsSkeletonPage extends StatelessWidget {
  const StoreDetailsSkeletonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        titleSpacing: 0,
        leading: Icon(Icons.arrow_back_ios_new),
        title: Text(
          "Store Details",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        shape: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: Colors.black12),
        ),
        backgroundColor: Colors.white,
      ),
      body: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[400]!,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: skeletonContainer(
                  height: 25,
                  width: 140,
                  radius: 5,
                  skullColor: false,
                ),
              ),
              SizedBox(height: 10),
              commonRowWidget(
                useAllRadius: true,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      skeletonContainer(
                        height: 15,
                        width: 80,
                        radius: 5,
                        skullColor: false,
                      ),
                      SizedBox(height: 10),
                      skeletonContainer(
                        height: 15,
                        width: 250,
                        radius: 5,
                        skullColor: false,
                      ),
                      SizedBox(height: 10),
                      skeletonContainer(
                        height: 15,
                        width: 150,
                        radius: 5,
                        skullColor: false,
                      ),
                      SizedBox(height: 10),
                      skeletonContainer(
                        height: 15,
                        width: 250,
                        radius: 5,
                        skullColor: false,
                      ),
                      SizedBox(height: 10),
                      skeletonContainer(
                        height: 15,
                        width: 150,
                        radius: 5,
                        skullColor: false,
                      ),
                      SizedBox(height: 10),
                      skeletonContainer(
                        height: 15,
                        width: 250,
                        radius: 5,
                        skullColor: false,
                      ),
                      SizedBox(height: 10),
                      skeletonContainer(
                        height: 15,
                        width: 80,
                        radius: 5,
                        skullColor: false,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: skeletonContainer(
                  height: 25,
                  width: 140,
                  radius: 5,
                  skullColor: false,
                ),
              ),
              SizedBox(height: 10),
              commonRowWidget(
                useAllRadius: true,
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      skeletonContainer(
                        height: 15,
                        width: 80,
                        radius: 5,
                        skullColor: false,
                      ),
                      SizedBox(height: 10),
                      skeletonContainer(
                        height: 15,
                        width: 250,
                        radius: 5,
                        skullColor: false,
                      ),
                      SizedBox(height: 10),
                      skeletonContainer(
                        height: 15,
                        width: 150,
                        radius: 5,
                        skullColor: false,
                      ),
                      SizedBox(height: 10),
                      skeletonContainer(
                        height: 15,
                        width: 250,
                        radius: 5,
                        skullColor: false,
                      ),
                      SizedBox(height: 10),
                      skeletonContainer(
                        height: 15,
                        width: 150,
                        radius: 5,
                        skullColor: false,
                      ),
                      SizedBox(height: 10),
                      skeletonContainer(
                        height: 15,
                        width: 250,
                        radius: 5,
                        skullColor: false,
                      ),
                      SizedBox(height: 10),
                      skeletonContainer(
                        height: 15,
                        width: 80,
                        radius: 5,
                        skullColor: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
