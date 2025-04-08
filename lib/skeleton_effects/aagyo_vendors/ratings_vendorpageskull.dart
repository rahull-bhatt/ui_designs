import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'all_common_widgets.dart';

class RatingsVendorPage extends StatelessWidget {
  const RatingsVendorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        titleSpacing: 0,
        leading: Icon(Icons.arrow_back_ios_new),
        title: Text(
          "Ratings",
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
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  commonRowWidget(
                    useAllRadius: false,
                    topLeftRadius: 15,
                    topRightRadius: 15,
                    height: 75,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          skeletonContainer(
                            height: 45,
                            width: 45,
                            radius: 10,
                          ),
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              skeletonContainer(
                                height: 12,
                                width: 140,
                                radius: 2,
                              ),
                              SizedBox(height: 10),
                              skeletonContainer(
                                height: 10,
                                width: 140,
                                radius: 2,
                              ),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  commonRowWidget(
                    height: 185,
                    useAllRadius: false,
                    bottomLeftRadius: 15,
                    bottomRightRadius: 15,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 2,top: 5),
                            child: skeletonContainer(
                              height: 15,
                              width: 100,
                              radius: 2,
                            ),
                          ),
                          SizedBox(height: 1),
                          ratingItemRow(),
                          SizedBox(height: 1),
                          ratingItemRow(),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget ratingItemRow() {
  return Column(
    children: [
      Row(
        children: [
          skeletonContainer(height: 45, width: 45, radius: 10),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              skeletonContainer(height: 12, width: 200, radius: 2),
              SizedBox(height: 10),
              skeletonContainer(height: 10, width: 60, radius: 2),
            ],
          ),
          Spacer(),
          skeletonContainer(height: 15, width: 30, radius: 5),
        ],
      ),
      SizedBox(height: 8),
      Row(
        children: [
          skeletonContainer(height: 15, width: 55, radius: 6),
          SizedBox(width: 10),
          skeletonContainer(height: 15, width: 75, radius: 6),
        ],
      ),
    ],
  );
}
