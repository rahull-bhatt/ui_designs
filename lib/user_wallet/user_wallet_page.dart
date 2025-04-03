import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_designs/user_wallet/controller.dart';

class WalletScreen extends StatelessWidget {
  final WalletController controller = Get.put(WalletController());

  WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Text(
          "Wallet",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white.withOpacity(0.3),
        shape: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.1),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        controller: controller.scrollController,
        shrinkWrap: true,
        children: [
          SizedBox(height: 30),
          Center(
            child: Container(
              padding: EdgeInsets.all(34),
              height: 150,
              width: 320,
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.15), borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Text(
                    "My Balance",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Obx(
                    () => Text(
                      "₹${(controller.walletModel.value.amount??0).toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Obx(() {
            if (controller.transactions.isEmpty &&
                controller.isFetching.value) {
              return Center(child: CircularProgressIndicator());
            } else if (controller.transactions.isEmpty) {
              return Center(child: Text("No Transactions Found"));
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:
                  controller.transactions.length +
                  (controller.hasMoreData.value ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == controller.transactions.length) {
                  return controller.hasMoreData.value
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox();
                }
                final txn = controller.transactions[index];
                return Container(
                  width: Get.size.width,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color:
                                    txn.type == "DEBIT"
                                        ? Colors.red
                                        : Colors.green,
                                width: 2,
                              ),
                            ),
                          ),
                          Container(
                            height: 95,
                            width: 1.5,
                            color: Colors.black.withOpacity(0.08),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Date: ${txn.createdAt}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          txn.type == "DEBIT"
                                              ? "purchase"
                                              : "cashback",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black.withOpacity(
                                              0.6,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "${txn.type == "DEBIT" ? "-₹" : "+₹"}${txn.amount}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                txn.type == "DEBIT"
                                                    ? Colors.red
                                                    : Colors.green,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(7),
                                        bottomRight: Radius.circular(7),
                                      ),
                                      color: Colors.grey.shade100,
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 7,
                                            horizontal: 7,
                                          ),
                                          child: Text(
                                            "Transaction ID: ${txn.transactionId}",
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 17),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
