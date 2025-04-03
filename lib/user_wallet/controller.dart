import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'wallet_transaction_model.dart';

class WalletController extends GetxController {
  RxList<TransactionWalletData> transactions = <TransactionWalletData>[].obs;

  int page = 1;
  int limit = 10;
  RxBool isFetching = false.obs;
  RxBool hasMoreData = true.obs;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getWalletData();
    getWalletBalance();
    scrollController.addListener(_scrollListener);
  }

  Future<void> getWalletData() async {
    if (isFetching.value || !hasMoreData.value) return;

    try {
      isFetching.value = true;
      update();

      String url =
          'https://api.aagyo.in/api/v1/user-wallet/transaction?limit=$limit&page=$page';
      const token =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2Njk2MGJhYzk0NzQ0NmMxN2Y1N2NjZjMiLCJ1c2VyTmFtZSI6IlJvc2hhbiBLdW1hciIsInVzZXJFbWFpbCI6Iis5MTg0NDk5MTU4ODgiLCJpYXQiOjE3NDA4OTU0NzIsImV4cCI6MTc0ODY3MTQ3Mn0.K56vcjB1vC7SQHGfwvDeFVFxqc9yPZ-MXmRDlvF95NM';

      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      );
      debugPrint("Response: ${response.body}");

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        List<TransactionWalletData> newTransactions =
            (jsonData['result']['data'] as List)
                .map((txn) => TransactionWalletData.fromJson(txn))
                .toList();

        if (newTransactions.isNotEmpty) {
          transactions.addAll(newTransactions);
          page++;
        } else {
          hasMoreData.value = false;
        }
      } else {
        debugPrint("API Error: ${response.body}");
      }
    } catch (e) {
      debugPrint('Error fetching transactions: $e');
    } finally {
      isFetching.value = false;
      update();
    }
  }

  Rx<WalletModel> walletModel = WalletModel().obs;
  Future<void> getWalletBalance() async {
    try {
      String url = 'https://api.aagyo.in/api/v1/user-wallet/balance';
      const token =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2Njk2MGJhYzk0NzQ0NmMxN2Y1N2NjZjMiLCJ1c2VyTmFtZSI6IlJvc2hhbiBLdW1hciIsInVzZXJFbWFpbCI6Iis5MTg0NDk5MTU4ODgiLCJpYXQiOjE3NDA4OTU0NzIsImV4cCI6MTc0ODY3MTQ3Mn0.K56vcjB1vC7SQHGfwvDeFVFxqc9yPZ-MXmRDlvF95NM';

      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      );

      debugPrint("Wallet API Response: ${response.body}");

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        walletModel.value = WalletModel.fromJson(jsonData);
      } else {
        debugPrint("API Error: ${response.body}");
      }
    } catch (e) {
      debugPrint('Error fetching wallet balance: $e');
    }
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      getWalletData();
      getWalletBalance();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
