import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePageSkeleton extends StatelessWidget {
  const HomePageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(toolbarHeight: 5, backgroundColor: Colors.white),
      body: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView(
          shrinkWrap: false,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      skeletonContainer(
                        height: 20,
                        width: 100,
                        radius: 3,
                        skullColor: false,
                      ),
                      SizedBox(height: 5),
                      skeletonContainer(
                        height: 15,
                        width: 230,
                        radius: 3,
                        skullColor: false,
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                  skeletonContainer(
                    height: 35,
                    width: 35,
                    radius: 35,
                    skullColor: false,
                  ),
                  SizedBox(width: 1),
                  skeletonContainer(
                    height: 45,
                    width: 45,
                    radius: 45,
                    skullColor: false,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: skeletonContainer(
                height: 45,
                width: double.maxFinite,
                radius: 13,
                skullColor: false,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 140,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Colors.black38,
                  ),
                ),
                skeletonContainer(
                  height: 180,
                  width: 280,
                  radius: 20,
                  skullColor: false,
                ),
                Container(
                  height: 140,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: skeletonContainer(
                  height: 22,
                  width: 100,
                  radius: 3,
                  skullColor: false,
                ),
              ),
            ),
            SizedBox(height: 14),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Number of columns
                    crossAxisSpacing: 10, // Space between columns
                    mainAxisSpacing: 45, // Space between rows
                    childAspectRatio: 1, // Width-to-height ratio
                  ),
                  itemCount: 12, // Total number of items
                  itemBuilder: (context, index) {
                    return skeletonContainer(
                      height: 5,
                      width: 5,
                      skullColor: false,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
              child: skeletonContainer(
                height: 45,
                width: double.maxFinite,
                skullColor: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
