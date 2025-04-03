import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget skeletonContainer({
  required double height,
  required double width,
  double? radius,
  bool skullColor = true,
  Color? color,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius ?? 10),
      color: skullColor == true ? Colors.white : (color ?? Colors.black38),
    ),
  );
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
