import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'home_page_skeleton.dart';

class OrdersSkeleton extends StatelessWidget {
  const OrdersSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        titleSpacing: 0,
        leading: Icon(Icons.arrow_back_ios_new),
        title: Text(
          "ORDERS",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        shape: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: Colors.black12),
        ),
        backgroundColor: Colors.white,
      ),
      body: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  skeletonContainer(
                    height: 45,
                    width: double.maxFinite,
                    radius: 13,
                    skullColor: false,
                    color: Colors.black54,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: skeletonContainer(
                      height: 15,
                      width: 120,
                      radius: 3,
                      skullColor: false,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: commonStoreRowWidget(useAllRadius: true),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget commonStoreRowWidget({
  bool useAllRadius = false,
  double allRadius = 10,
  double topLeftRadius = 0,
  double topRightRadius = 0,
  double bottomLeftRadius = 0,
  double bottomRightRadius = 0,
  double? height,
}) {
  return commonRowWidget(
    useAllRadius: useAllRadius, // automatically forwarding parameters
    allRadius: allRadius,
    topLeftRadius: topLeftRadius,
    topRightRadius: topRightRadius,
    bottomLeftRadius: bottomLeftRadius,
    bottomRightRadius: bottomRightRadius,
    height: height,
    child: Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          skeletonContainer(height: 50, width: 50, radius: 10),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              skeletonContainer(height: 15, width: 50, radius: 5),
              SizedBox(height: 10),
              skeletonContainer(height: 10, width: 150, radius: 5),
              SizedBox(height: 5),
              skeletonContainer(height: 10, width: 100, radius: 5),
            ],
          ),
          Spacer(),
          skeletonContainer(height: 25, width: 25, radius: 25),
        ],
      ),
    ),
  );
}

Widget commonRowWidget({
  bool useAllRadius = false,
  double allRadius = 10,
  double topLeftRadius = 0,
  double topRightRadius = 0,
  double bottomLeftRadius = 0,
  double bottomRightRadius = 0,
  Widget? child,
  double? height,
}) {
  return Container(
    height: height ?? 73,
    width: double.maxFinite,
    decoration: BoxDecoration(
      borderRadius:
          useAllRadius
              ? BorderRadius.circular(allRadius)
              : BorderRadius.only(
                topLeft: Radius.circular(topLeftRadius),
                topRight: Radius.circular(topRightRadius),
                bottomLeft: Radius.circular(bottomLeftRadius),
                bottomRight: Radius.circular(bottomRightRadius),
              ),
      color: Colors.black38,
    ),
    child:
        child ?? SizedBox(), // If child is null then it will use empty widget
  );
}
