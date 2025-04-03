import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SlotBookingPage extends StatelessWidget {
  const SlotBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    String dateHeader =
        DateFormat("d MMMM").format(DateTime.now()).toUpperCase();
    List<Map<String, String>> bookedSlots = [
      {"time": "3:00pm - 4:00pm", "type": "Regular"},
      {"time": "5:00pm - 6:00pm", "type": "Express"},
      {"time": "7:00pm - 8:00pm", "type": "Regular"},
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.close, size: 20),
          ),
        ),
        centerTitle: false,
        titleSpacing: -15,
        title: Text(
          'Booking Status',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Date Header
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(color: Colors.grey.shade300, thickness: 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    dateHeader,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(color: Colors.grey.shade300, thickness: 1),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.teal.shade50,
              ),
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_rounded,
                        color: Colors.teal,
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "${bookedSlots.length} Slots booked",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: bookedSlots.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bookedSlots[index]["time"]!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  bookedSlots[index]["type"]!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "10 min break",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Spacer(),

            // Estimated Payout
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              color: Colors.blue.shade700,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Estimated payout",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Text(
                    "₹70 - ₹100",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Button
            SafeArea(
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
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: 330, // Button Width
                            height: 50, // Button Height
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black, // Button color
                              borderRadius: BorderRadius.circular(
                                10,
                              ), // Rounded Button
                            ),
                            child: Text(
                              "Okay, Got it",
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade100,
    );
  }
}
