import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_designs/runner_slotting/slot_booking_page.dart';
import 'slot_page_controller.dart';

class SlotPageDetails extends StatelessWidget {
  final String date;
  final String month;
  SlotPageDetails({super.key, required this.month, required this.date});
  final SlotPageController controller = Get.put(SlotPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.arrow_back_ios_sharp, size: 20),
          ),
        ),
        centerTitle: false,
        titleSpacing: -15,
        title: Text(
          "Slot, $date $month",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        // shape: OutlineInputBorder(
        //   borderSide: BorderSide(
        //     width: 0.5,
        //     color: Colors.black.withOpacity(0.1),
        //   ),
        // ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Container(
            color: Colors.white,
            child: tapBar(),
          ), //  Tabs dynamically change color
          Obx(() => buildSelectedView()),
        ],
      ),
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: bottomNavBar(),
    );
  }

  // Reusable tab button function

  Widget customTabButton(String label, int index) {
    return InkWell(
      onTap: () {
        controller.changeIndex(index); // Calls changeIndex on tap
      },
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
            color:
                controller.selectedTap.value == index
                    ? Colors.black
                    : Colors.grey[200], // Selection logic
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1, color: Colors.black),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 1),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color:
                    controller.selectedTap.value == index
                        ? Colors.white
                        : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Tabs are now dynamic

  Widget tapBar() {
    return Padding(
      padding: EdgeInsets.only(left: 16, bottom: 14),
      child: Row(
        children: [
          customTabButton("All", 0),
          SizedBox(width: 10),
          customTabButton("Open", 1),
          SizedBox(width: 10),
          customTabButton("Booked", 2),
        ],
      ),
    );
  }

  //  Function to switch UI based on selected tab

  Widget buildSelectedView() {
    switch (controller.selectedTap.value) {
      case 0:
        return allSlotsView();
      case 1:
        return openSlotsView();
      case 2:
        return bookedSlotsView();
      default:
        return allSlotsView();
    }
  }

  // Different UIs for each tab

  Widget allSlotsView() {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 50),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.green,
              ),
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Breakfast",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "3:00pm - 7:00pm • 4 Slots",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.sunny_snowing,
                    color: Colors.orangeAccent,
                    size: 30,
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 0.5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            index != 1
                                ? BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 0.5,
                                )
                                : BorderSide.none, // Last item ka border remove
                      ),
                    ),
                    child: Obx(
                      () => CheckboxListTile(
                        value: controller.breakFastBooked[index],
                        onChanged: (value) {
                          if (value != null) {
                            controller.changeBooked(value, index);
                          }
                        },
                        activeColor: Colors.blue,
                        title: Text(
                          '3:00pm - 4:00pm',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '₹105 - ₹140 per hour',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.green,
              ),
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Afternoon",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "3:00pm - 7:00pm • 4 Slots",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.sunny, color: Colors.orangeAccent, size: 30),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 0.5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            index != 1
                                ? BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 0.5,
                                )
                                : BorderSide.none, // Last item ka border remove
                      ),
                    ),
                    child: CheckboxListTile(
                      value: true,
                      onChanged: (value) {},
                      activeColor: Colors.white,
                      title: Text(
                        '3:00pm - 4:00pm',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '₹105 - ₹140 per hour',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.green,
              ),
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Evening",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "3:00pm - 7:00pm • 4 Slots",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.nightlight_round,
                    color: Colors.yellowAccent,
                    size: 30,
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 0.5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            index != 1
                                ? BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 0.5,
                                )
                                : BorderSide.none, // Last item ka border remove
                      ),
                    ),
                    child: CheckboxListTile(
                      value: true,
                      onChanged: (value) {},
                      activeColor: Colors.white,
                      title: Text(
                        '3:00pm - 4:00pm',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '₹105 - ₹140 per hour',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 15),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.green,
              ),
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Night",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "3:00pm - 7:00pm • 4 Slots",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.nightlight, color: Colors.orangeAccent, size: 30),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 0.5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            index != 4
                                ? BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 0.5,
                                )
                                : BorderSide.none, // Last item ka border remove
                      ),
                    ),
                    child: CheckboxListTile(
                      value: true,
                      onChanged: (value) {},
                      activeColor: Colors.white,
                      title: Text(
                        '3:00pm - 4:00pm',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '₹105 - ₹140 per hour',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                      ),
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

  Widget openSlotsView() {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 50),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.green,
              ),
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Breakfast",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "3:00pm - 7:00pm • 4 Slots",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.sunny_snowing,
                    color: Colors.orangeAccent,
                    size: 30,
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 0.5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            index != 1
                                ? BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 0.5,
                                )
                                : BorderSide.none, // Last item ka border remove
                      ),
                    ),
                    child: Obx(
                      () => CheckboxListTile(
                        value: controller.breakFastBooked[index],
                        onChanged: (value) {
                          if (value != null) {
                            controller.changeBooked(value, index);
                          }
                        },
                        activeColor: Colors.blue,
                        title: Text(
                          '3:00pm - 4:00pm',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '₹105 - ₹140 per hour',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.green,
              ),
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Afternoon",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "3:00pm - 7:00pm • 4 Slots",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.sunny, color: Colors.orangeAccent, size: 30),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 0.5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            index != 1
                                ? BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 0.5,
                                )
                                : BorderSide.none, // Last item ka border remove
                      ),
                    ),
                    child: CheckboxListTile(
                      value: true,
                      onChanged: (value) {},
                      activeColor: Colors.white,
                      title: Text(
                        '3:00pm - 4:00pm',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '₹105 - ₹140 per hour',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.green,
              ),
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Evening",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "3:00pm - 7:00pm • 4 Slots",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.nightlight_round,
                    color: Colors.yellowAccent,
                    size: 30,
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 0.5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            index != 1
                                ? BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 0.5,
                                )
                                : BorderSide.none, // Last item ka border remove
                      ),
                    ),
                    child: CheckboxListTile(
                      value: true,
                      onChanged: (value) {},
                      activeColor: Colors.white,
                      title: Text(
                        '3:00pm - 4:00pm',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '₹105 - ₹140 per hour',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 15),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.green,
              ),
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Night",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "3:00pm - 7:00pm • 4 Slots",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.nightlight, color: Colors.orangeAccent, size: 30),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 0.5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            index != 4
                                ? BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 0.5,
                                )
                                : BorderSide.none, // Last item ka border remove
                      ),
                    ),
                    child: CheckboxListTile(
                      value: true,
                      onChanged: (value) {},
                      activeColor: Colors.white,
                      title: Text(
                        '3:00pm - 4:00pm',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '₹105 - ₹140 per hour',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                      ),
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

  Widget bookedSlotsView() {
    return Center(
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.asset(
          'images/found.png',
          width: 200,
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget bottomNavBar() {
    return SafeArea(
      child: Container(
        height: 75, // Fixed height
        padding: EdgeInsets.only(top: 0), // Padding on top
        decoration: BoxDecoration(
          color: Colors.white, // Background color
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Continue Button at Center
            Positioned(
              left: 0,
              right: 0,
              bottom: 12, // Move slightly up
              child: Center(
                child: Obx(
                  () => InkWell(
                    onTap: controller.isAnySlotSelected.value? (){Get.to(()=> SlotBookingPage());} : null,
                    child: Container(
                      width: 330, // Button Width
                      height: 50, // Button Height
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: controller.isAnySlotSelected.value ? Colors.black : Colors.grey, // Button color
                        borderRadius: BorderRadius.circular(
                          10,
                        ), // Rounded Button
                      ),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
