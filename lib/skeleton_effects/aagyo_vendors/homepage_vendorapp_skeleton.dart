import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'all_common_widgets.dart';

class HomepageVendorSkull extends StatelessWidget {
  const HomepageVendorSkull({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: ListView(
        shrinkWrap: true,
        children: [
          commonRowWidget(height: 45),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[400]!,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
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
                                      width: 120,
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
                                skeletonContainer(
                                  height: 20,
                                  width: 52,
                                  radius: 8,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 1),
                        commonRowWidget(
                          height: 20,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                skeletonContainer(
                                  height: 13,
                                  width: 65,
                                  radius: 2,
                                ),
                                Spacer(),
                                skeletonContainer(
                                  height: 13,
                                  width: 65,
                                  radius: 2,
                                ),
                                SizedBox(width: 5,),
                                skeletonContainer(
                                  height: 15,
                                  width: 30,
                                  radius: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 1),
                        commonRowWidget(
                          height: 75,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                skeletonContainer(
                                  height: 15,
                                  width: 120,
                                  radius: 2,
                                ),
                                Spacer(),
                                skeletonContainer(
                                  height: 30,
                                  width: 30,
                                  radius: 8,
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
                          height: 35,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: skeletonContainer(
                                height: 15,
                                width: 140,
                                radius: 2,
                              ),
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
        ],
      ),
    );
  }
}
