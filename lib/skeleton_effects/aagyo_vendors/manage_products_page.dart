import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'all_common_widgets.dart';

class ManageProductsPage extends StatelessWidget {
  const ManageProductsPage({super.key});

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
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[600]!,
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
                      height: 45,
                      width: double.maxFinite,
                      radius: 13,
                      skullColor: false,
                    ),
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
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 14, // Space between columns
                      // mainAxisSpacing: 45, // Space between rows
                      childAspectRatio: 0.5, // Width-to-height ratio
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
    );
  }
}

Widget manageProductSkull() {
  return Column(
    children: [
      Container(
        height: 160,
        width: 160,
        decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)), color: Colors.black38),
      ),
      SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.only(left: 2),
        child: Align(
            alignment: Alignment.centerLeft,
            child: skeletonContainer(height: 10, width: 70, radius: 2, skullColor: false)),
      ),
      SizedBox(height: 8),
      Padding(
        padding: const EdgeInsets.only(left: 2),
        child: Align(
            alignment: Alignment.centerLeft,
            child: skeletonContainer(height: 10, width: 60, radius: 2, skullColor: false)),
      ),
      SizedBox(height: 30),
      Padding(
        padding: const EdgeInsets.only(left: 2, right: 5),
        child: Row(
          children: [
            skeletonContainer(
              height: 10,
              width: 20,
              radius: 2,
              skullColor: false,
            ),
            Spacer(),
            skeletonContainer(
              height: 20,
              width: 50,
              radius: 5,
              skullColor: false,
            ),
          ],
        ),
      ),
    ],
  );
}
