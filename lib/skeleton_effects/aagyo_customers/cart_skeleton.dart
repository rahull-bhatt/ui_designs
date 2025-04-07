import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'home_page_skeleton.dart';

class CartSkeleton extends StatelessWidget {
  const CartSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        titleSpacing: 0,
        leading: Icon(Icons.arrow_back_ios_new),
        title: Text(
          "CART",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        shape: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: Colors.black12),
        ),
        backgroundColor: Colors.white,
      ),
      body: Shimmer.fromColors(
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[600]!,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: skeletonContainer(
                  height: 25,
                  width: 140,
                  radius: 2,
                  skullColor: false,
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        skeletonContainer(
                          height: 60,
                          width: 60,
                          radius: 5,
                          skullColor: false,
                        ),
                        SizedBox(width: 5),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              skeletonContainer(
                                height: 13,
                                width: 160,
                                radius: 2,
                                skullColor: false,
                              ),
                              SizedBox(height: 10),
                              skeletonContainer(
                                height: 10,
                                width: 100,
                                radius: 2,
                                skullColor: false,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 50),
                        skeletonContainer(
                          height: 20,
                          width: 50,
                          radius: 2,
                          skullColor: false,
                        ),
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: skeletonContainer(
                  height: 1.5,
                  width: double.maxFinite,
                  radius: 1,
                  skullColor: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
