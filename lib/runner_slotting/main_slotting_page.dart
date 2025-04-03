import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_designs/runner_slotting/slot_page_details.dart';
import 'main_slotting_controller.dart';
import 'package:intl/intl.dart';

class CustomBottomNav extends StatelessWidget {
  final SlottingController controller = Get.find();

  CustomBottomNav({super.key}); // GetX controller ko retrieve

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.selectedIcon.value,
        onTap: (index) => controller.changeIndex(index),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ), //  Bold font for selected label
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet, color: Colors.orange),
            label: 'Pocket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining, color: Colors.black),
            label: "Slots",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, color: Colors.red),
            label: 'Bazaar',
          ),
        ],
      ),
    );
  }
}

// SlottingPage
class SlottingPage extends StatelessWidget {
  SlottingPage({super.key});

  final SlottingController controller = Get.put(SlottingController());

  final List<Map<String, String>> slotsData = [
    {
      "date": "14-03-2025",
      "day": "Fri",
      "status": "Booking open",
      "description": "Book Star Slots to improve your medal",
    },
    {
      "date": "15-03-2025",
      "day": "Sat",
      "status": "Booking open",
      "description": "Unlock by improving medal to diamond",
    },
    {
      "date": "12-03-2025",
      "day": "Wed",
      "status": "Booking open",
      "description": "Book Star Slots to improve your medal",
    },
    {
      "date": "13-03-2025",
      "day": "Thu",
      "status": "Booking open",
      "description": "Book Star Slots to improve your medal",
    },
    {
      "date": "16-04-2025",
      "day": "Sun",
      "status": "Booking locked",
      "description": "Unlock by improving medal to diamond",
    },
    {
      "date": "17-04-2025",
      "day": "Mon",
      "status": "Booking open",
      "description": "Book Star Slots to improve your medal",
    },
    {
      "date": "16-05-2025",
      "day": "Sun",
      "status": "Booking locked",
      "description": "Unlock by improving medal to diamond",
    },
    {
      "date": "16-05-2025",
      "day": "Sun",
      "status": "Booking open",
      "description": "Book Star Slots to improve your medal",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Slots',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        shape: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: Colors.black.withOpacity(0.1),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[200], // Light grey background
      body: ListView.builder(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.all(16),
        itemCount: slotsData.length,
        itemBuilder: (context, index) {
          var slots = slotsData[index];

          // Extract month from date
          DateTime slotsDate = DateFormat("dd-MM-yyyy").parse(slots["date"]!);
          String monthHeader = DateFormat(
            "MMMM",
          ).format(slotsDate); //  Month extract

          // Condition to show "Month Header"
          bool showMonthHeader =
              index == 0 ||
              (DateFormat("MMMM").format(
                    DateFormat(
                      "dd-MM-yyyy",
                    ).parse(slotsData[index - 1]["date"]!),
                  ) !=
                  monthHeader);

          return Column(
            children: [
              if (showMonthHeader)
                monthHeaderWidget(monthHeader),
              slotsCard(
                date: DateFormat("dd").format(slotsDate), // Extract day from date
                day: slots["day"]!,
                status: slots["status"]!,
                description: slots["description"]!,
                slotsDate: slotsDate, // Pass slotsDate to correctly extract month
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}


Widget monthHeaderWidget(String monthHeader){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.blueGrey.shade700,
            thickness: 1,
            indent: 12,
            endIndent: 10,
          ),
        ),
        Text(
          monthHeader.toUpperCase().split('').join(''),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey.shade700,
            letterSpacing: 2,
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.blueGrey.shade700,
            thickness: 1,
            indent: 10,
            endIndent: 12,
          ),
        ),
      ],
    ),
  );
}
//  slots Card Widget
Widget slotsCard({
  required String day,
  required String date,
  required String status,
  required String description,
  required DateTime slotsDate,
  icon,
}) {
  return InkWell(
    onTap:
        () => Get.to(
          () => SlotPageDetails(
            date: date,
            month: DateFormat("MMM").format(slotsDate),
          ),
        ),
    child: Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  Green Date Box
          SizedBox(
            width: 80,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    date,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    day,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //  Right Side Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      status,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Icon(
                          status == "Booking open"
                              ? Icons.star_border_outlined
                              : Icons.workspace_premium,
                          size: 20,
                          color: Colors.blueGrey.shade600,
                        ),
                      ),
                      SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          description,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade600,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
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
    ),
  );
}
