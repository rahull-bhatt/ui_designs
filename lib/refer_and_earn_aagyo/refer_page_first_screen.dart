import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'after_page.dart';

class ReferEarnScreen extends StatelessWidget {
  const ReferEarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.grey.shade200),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () => Get.to(() => AfterPageRefer()),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Center(
                    child: Container(
                      height: 120,
                      width: double.maxFinite,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.shade50,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              "Invite friends to get ₹21",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 3),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              "Referral code: 08373jh",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                          SizedBox(height: 34),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              "Invite & earn",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -12,
                right: 13,
                child: SizedBox(
                    height: 130,
                    width: 130,
                    child: Image.asset('images/referit.png', fit: BoxFit.contain,)
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
