import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_designs/refer_and_earn_aagyo/view_more_page.dart';
import 'package:ui_designs/skeleton_effects/aagyo_customers/home_page_skeleton.dart';

class AfterPageRefer extends StatelessWidget {
  const AfterPageRefer({super.key});

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
      backgroundColor: Colors.white,
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Column(
            children: [
              inviteContainer(),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: referralInfoContainer(),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  color: Colors.grey.shade200,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 20),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: cashbackInfoContainer(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  color: Colors.grey.shade200,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
              ),
              SizedBox(height: 20),
              referContactsWidget(),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}

Widget inviteContainer() {
  return Stack(
    children: [
      Container(
        // height: 135,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.blue.shade50),
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Refer a friend and \nearn ₹21",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 25),
              Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(child: Text("Invite friends")),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
      Positioned(
        bottom: -15,
        right: 0,
        child: SizedBox(
          height: 170,
            width: 170,
            child: Image.asset('images/referandearn.png', fit: BoxFit.contain,)
        ),
      )],
  );
}

Widget cashbackInfoContainer() {
  return SizedBox(
    child: Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            "How to earn ₹21 cashback",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 25),
        rewardsDetailRow(
          icon: Icons.person_add_alt_1,
          title:
              'Invite your friend to Aagyo with your unique referral code: 5h8ui93',
        ),
        SizedBox(height: 17),
        rewardsDetailRow(
          icon: Icons.currency_rupee,
          title: 'Earn ₹21 cashback when your friend makes their first order',
        ),
        SizedBox(height: 17),
        rewardsDetailRow(
          icon: Icons.star,
          title:
              'Bonus quests: Earn ₹100 instant cashback when your referral friend completes their 5 regular orders on Aagyo',
        ),
        SizedBox(height: 40),
      ],
    ),
  );
}

Widget rewardsDetailRow({required IconData icon, required String title}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon, color: Colors.blue[800], size: 28),
      SizedBox(width: 8),
      Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget referralInfoContainer() {
  return SizedBox(
    height: 140,
    width: double.maxFinite,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            color: Colors.blue.shade100,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  'Cashback earned',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: InkWell(
                  onTap: () => Get.to(ViewMorePage()),
                  child: Text(
                    'View all',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            color: Colors.black12,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'CASHBACK',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '₹120',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'REFERRED',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '08',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'PENDING',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '03',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget referContactsWidget() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Refer friends',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            Icon(Icons.search, size: 24),
          ],
        ),

      ),
      SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Aagyo',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
            Text('+91785563344',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)
          ],
        ),
      ),
      SizedBox(height: 50,)
    ],
  );
}
