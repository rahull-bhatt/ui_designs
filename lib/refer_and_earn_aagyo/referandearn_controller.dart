import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'referandearn_model.dart';
import '../common_model/metadata.dart';

class ReferController extends GetxController {
  RxBool isFetchingReferral = false.obs;
  RxList<ReferTrackData> referTrackData = <ReferTrackData>[].obs;
  Rx<Metadata> referMetadata = Metadata().obs;

  int page = 1;
  int limit = 10;
  var selectedTab = 'Referred'.obs;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    fetchReferralData();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      page++;
      fetchReferralData();
    }
  }

  void setSelectedTab(String tab) {
    selectedTab.value = tab;
  }


  Future<void> fetchReferralData() async {
    if (isFetchingReferral.value) return;

    try {
      isFetchingReferral.value = true;

      String url =
          'https://api.aagyo.in/api/v1/referAndEarn/user/refer-track?limit=$limit&page=$page';

      const token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2Njk2MGJhYzk0NzQ0NmMxN2Y1N2NjZjMiLCJ1c2VyTmFtZSI6IlJvc2hhbiBLdW1hciIsInVzZXJFbWFpbCI6Iis5MTg0NDk5MTU4ODgiLCJpYXQiOjE3NDA4OTU0NzIsImV4cCI6MTc0ODY3MTQ3Mn0.K56vcjB1vC7SQHGfwvDeFVFxqc9yPZ-MXmRDlvF95NM';

      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      );

      debugPrint("Response: ${response.body}");

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        List<ReferTrackData> fetchedData =
        (jsonData['result']['data'] as List)
            .map((v) => ReferTrackData.fromJson(v))
            .toList();

        if (jsonData['result']['metadata'] != null &&
            (jsonData['result']['metadata'] as List).isNotEmpty) {
          referMetadata.value = Metadata.fromJson(
            jsonData['result']['metadata'][0],
          );
        }

        if (page == 1) {
          referTrackData.value = fetchedData;
        } else {
          referTrackData.addAll(fetchedData);
        }
      } else {
        debugPrint("Failed to load data");
      }
    } catch (e) {
      debugPrint("Referral fetch error: $e");
    } finally {
      isFetchingReferral.value = false;
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}