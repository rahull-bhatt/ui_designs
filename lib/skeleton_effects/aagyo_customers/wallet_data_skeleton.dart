import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ui_designs/skeleton_effects/aagyo_customers/home_page_skeleton.dart';
import 'package:ui_designs/skeleton_effects/aagyo_customers/orders_skeleton.dart';


class WalletDataSkeleton extends StatelessWidget {
  const WalletDataSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Wallet Data Skeleton')),
      body: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[500]!,
        child: ListView(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                    child: commonRowWidget(
                      height: 100,
                      useAllRadius: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: skeletonContainer(height: 20, width: 120,radius: 5,skullColor: false),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: skeletonContainer(height: 20, width: 40,radius: 5,skullColor: false),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Divider(thickness: 1,color: Colors.black38,),
                          Padding(
                            padding: const EdgeInsets.only(left: 8,right: 8,bottom: 10),
                            child: Row(
                              children: [skeletonContainer(height: 14, width: 180,radius: 4,skullColor: false)],
                            ),
                          )
                        ],
                      )
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}