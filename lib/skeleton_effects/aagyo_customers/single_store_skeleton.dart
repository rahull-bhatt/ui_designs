import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'other_skeletons.dart';

class SingleStoreSkeleton extends StatelessWidget {
  const SingleStoreSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(toolbarHeight: 110, backgroundColor: Colors.black12),
      body: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
          child: Builder(
            builder: (context) => storeSkeleton(scrollDirection: false),
          ),
        ),
      ),
    );
  }
}
