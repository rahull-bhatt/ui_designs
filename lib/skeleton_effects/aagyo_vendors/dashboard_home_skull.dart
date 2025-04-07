import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ui_designs/skeleton_effects/aagyo_customers/home_page_skeleton.dart';

class DashboardHomePage extends StatelessWidget {
  const DashboardHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        titleSpacing: 0,
        title: Center(
          child: Text(
            "Your Store is Closed",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        shape: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: Colors.black12),
        ),
        backgroundColor: Colors.red,
      ),
      body: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[400]!,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 5),
               child: earningLossesRow(),
             ),
             SizedBox(height: 20,),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 5),
               child: earningLossesRow(),
             ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: productOrderDetails(),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: productOrderDetails(),
              ),
            ],
          ),
        )
      ),
    );
  }
}

Widget earningLossesRow(
    ){
  double width = Get.width;
  return Column(
    children: [
      Align(
          alignment: Alignment.centerLeft,
          child: skeletonContainer(height: 25, width: width*0.55, radius: 8)),
      SizedBox(height: 15,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          skeletonContainer(height: 145, width: width*0.32, radius: 10),
          SizedBox(width: 5,),
          Column(
            children: [
              skeletonContainer(height: 66, width: width*0.58,radius: 10),
              SizedBox(height: 7,),
              Row(
                children: [
                  skeletonContainer(height: 68, width: width*0.28,radius: 10),
                  SizedBox(width: 5,),
                  skeletonContainer(height: 68, width: width*0.28,radius: 10),
                ],
              )
            ],
          )
        ],
      )
    ],
  );
}

Widget productOrderDetails (){
  double width = Get.width;
  return Column(
    children: [
      Align(
          alignment: Alignment.centerLeft,
          child: skeletonContainer(height: 25, width: width*0.55, radius: 8)),
      SizedBox(height: 15,),
      Row(
        children: [
          skeletonContainer(height: 87, width: width*0.45,radius: 10),
          SizedBox(width: 5,),
          skeletonContainer(height: 87, width: width*0.45,radius: 10),
        ],
      )
    ],
  );
}
