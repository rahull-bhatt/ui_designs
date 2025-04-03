import 'package:flutter/material.dart';
import 'package:ui_designs/user_wallet/controller.dart';
import 'package:get/get.dart';

class Billscreen extends StatefulWidget {
  const Billscreen({super.key});

  @override
  State<Billscreen> createState() => _BillscreenState();
}

class _BillscreenState extends State<Billscreen> {
  final WalletController controller = Get.put(WalletController());
  // Controllers for the input fields
  TextEditingController unitController = TextEditingController();
  TextEditingController rateController = TextEditingController();

  // FocusNodes to control focus on the text fields
  FocusNode unitFocusNode = FocusNode();
  FocusNode rateFocusNode = FocusNode();

  // Variable to store the total bill
  double totalBill = 0.0;

  // Function to calculate the bill
  void calculateBill() {
    // Parsing the input values as double and handling invalid input with ?? 0.0
    double unit = double.tryParse(unitController.text) ?? 0;
    double rate = double.tryParse(rateController.text) ?? 0;

    // Calculate the total bill and update the UI
    setState(() {
      totalBill = unit * rate;
    });

    // Remove focus from the text fields to hide the cursor
    unitFocusNode.unfocus();
    rateFocusNode.unfocus();
  }

  // Function to reset the form
  void resetFields() {
    setState(() {
      unitController.clear(); // Clears the "Unit" field
      rateController.clear(); // Clears the "Rate" field
      totalBill = 0.0; // Resets the total bill
    });

    // Remove focus from both text fields after reset
    unitFocusNode.unfocus();
    rateFocusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            SizedBox(height: 40),
            Icon(Icons.offline_bolt, color: Colors.orange, size: 40),
            SizedBox(height: 30),
            Center(
              child: Text(
                "Electric Bill",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                "calculator",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(padding: EdgeInsets.only(left: 17.0), child: Text("Units")),
            SizedBox(height: 3),
            TextField(
              controller: unitController,
              focusNode: unitFocusNode, // Assign focus node to this TextField
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.double_arrow,
                  color: Colors.black.withOpacity(0.4),
                  size: 20,
                ),
                hintText: "Enter units of bill (KW)",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.7)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.orange, width: 2),
                ),
              ),
            ),
            SizedBox(height: 50),
            Padding(padding: EdgeInsets.only(left: 17.0), child: Text("Rate")),
            SizedBox(height: 3),
            TextField(
              controller: rateController,
              focusNode: rateFocusNode, // Assign focus node to this TextField
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.double_arrow,
                  color: Colors.black.withOpacity(0.4),
                  size: 20,
                ),
                hintText: "Enter rate per unit",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.7)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.orange, width: 2),
                ),
              ),
            ),
            SizedBox(height: 80),
            // Calculate Button
            Center(
              child: GestureDetector(
                onTap:
                    calculateBill, // Calling calculateBill when the button is pressed
                child: Container(
                  width: 190,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Reset Button
            Center(
              child: GestureDetector(
                onTap:
                    resetFields, // Calling resetFields when the reset button is pressed
                child: Container(
                  width: 190,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Reset",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Displaying the Total Bill
            Center(
              child: Container(
                height: 150,
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange, width: 0.6),
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Text(
                        "Total Bill",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Rs ${totalBill.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Center(
                    child: Text(
                      "Issued in public interest by ministry of flutter with fun affairs",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
                height: 50,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
