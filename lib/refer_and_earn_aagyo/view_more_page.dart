import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_designs/refer_and_earn_aagyo/referandearn_controller.dart';

import 'after_page.dart';

class ViewMorePage extends StatelessWidget {
  final controller = Get.put(ReferController());
  ViewMorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        surfaceTintColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 10),
        //     child: Icon(Icons.more_vert, color: Colors.black),
        //   ),
        // ],
      ),
      body: Column(
        children: [
          inviteContainer(),
          Obx(
            () => Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: viewAllDetailsList(controller),
            ),
          ), // reactive
          Obx(() {
            switch (controller.selectedTab.value) {
              case 'Referred':
                return referredInfoBody();
              case 'Pending':
                return pendingInfoBody();
              default:
                return SizedBox();
            }
          }),
        ],
      ),
    );
  }

  Widget viewAllDetailsList(ReferController controller) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey.shade100,
      padding: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
            ['Referred', 'Pending'].map((tab) {
              final isSelected = controller.selectedTab.value == tab;
              return InkWell(
                onTap: () => controller.setSelectedTab(tab),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      tab,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: isSelected ? Colors.black : Colors.black38,
                      ),
                    ),
                    SizedBox(height: 6),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: isSelected ? 5 : 0, // underline height
                      width: 60,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.transparent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget referredInfoBody() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Container(
            height: 70,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.blue.shade50,
            ),
            child: Row(
              children: [
                SizedBox(width: 10),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 35,
                    width: 35,
                    child: Image.asset('images/gift.png', fit: BoxFit.contain),
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12),
                    Text(
                      'Rahul Bhatt',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Aug 22, 2025',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '+ ₹51',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget pendingInfoBody() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              height: 70,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.blue.shade50,
              ),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 35,
                      width: 35,
                      child: Image.asset(
                        'images/gift.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12),
                      Text(
                        'Anshuman pant',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Aug 22, 2025',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 15),
                        Text(
                          '    Pending',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '+ ₹101',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget expireInfoBody() {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: 2,
    itemBuilder: (context, index) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Container(
            height: 70,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.blue.shade50

            ),
            child: Row(
              children: [
                SizedBox(width: 10),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black26,
                    ),
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset(
                        'images/null.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Anshuman pant',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black26,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Expired',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black26,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
