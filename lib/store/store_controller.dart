import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ui_designs/store/store_model.dart';

class StoreController extends GetxController {
  RxList<CategoryData> categoryData = <CategoryData>[].obs;
  RxList<ProductData> productData = <ProductData>[].obs;
  var selectedCategoryIndex = 0.obs;

  int categoryPage = 1;
  int limit = 10;
  RxBool isFetchingCategory = false.obs;
  RxBool hasMoreCategoryData = true.obs;
  RxBool isFetchingProduct = false.obs;

  final ScrollController scrollCategoryController = ScrollController();
  final ScrollController scrollProductController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    fetchCategoryApi();

    scrollCategoryController.addListener(_scrollCategoryListener);
    scrollProductController.addListener(_scrollProductListener);
  }

  Future<void> fetchCategoryApi() async {
    if (isFetchingCategory.value || !hasMoreCategoryData.value) return;

    try {
      isFetchingCategory.value = true;
      // update();

      String url =
          'https://api.aagyo.in/api/v1/category/page/671a34bcf5f9b4ff5bde6422?page=$categoryPage&limit=10';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        debugPrint("Response: ${jsonData['data'][0]}");

        List<CategoryData> categoryDataNew =
            (jsonData['data'][0]['data'] as List)
                .map((item) => CategoryData.fromJson(item))
                .toList();

        if (categoryDataNew.isNotEmpty) {
          if (categoryPage == 1) {
            productData.clear();
            productCallApi(categoryDataNew[0].sId!);
          }
          categoryData.addAll(categoryDataNew);
          categoryPage++;
        } else {
          hasMoreCategoryData.value = false;
        }
      } else {
        debugPrint("API Error: ${response.body}");
      }
    } catch (e) {
      debugPrint('Error fetching categoryData: $e');
    } finally {
      isFetchingCategory.value = false;
      categoryData.refresh();
    }
  }

  ///fetch product Api
  void productCallApi(String categoryId) async {
    if (isFetchingProduct.value) return;

    isFetchingProduct.value = true;
    await fetchProductApi(categoryId: categoryId);
    isFetchingProduct.value = false;
  }


  Rx<Metadata> productMetadata = Metadata(maxPage: 1, page: 1, total: 0).obs;
  Future<void> fetchProductApi({
    String? categoryId,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      String url = 'https://api.aagyo.in/api/v1/product/by-category-forUser';

      final response = await http.get(
        Uri.parse(url).replace(
          queryParameters: {
            "page": "$page",
            "limit": "$limit",
            "storeId": "671a34bcf5f9b4ff5bde6422",
            "categoryId": categoryId,
          },
        ),
      );
      debugPrint("Response: ${response.body}");

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        if (jsonData["result"] != null && jsonData["result"]["data"] != null) {
          List<ProductData> productDataNew =
              (jsonData['result']['data'] as List)
                  .map((txn) => ProductData.fromJson(txn))
                  .toList();

          if (jsonData["result"]["metadata"] != null &&
              jsonData["result"]["metadata"].length > 0) {
            productMetadata.value = Metadata.fromJson(
              jsonData["result"]["metadata"][0],
            );
          }

          if (productDataNew.isNotEmpty) {
            productData.addAll(productDataNew);
          }
        } else {
          debugPrint("API Error: ${response.body}");
        }
      }
    } catch (e) {
      debugPrint('Error fetching productData: $e');
    } finally {
      productData.refresh();
    }
  }

  void _scrollCategoryListener() {
    if (scrollCategoryController.position.pixels >=
        scrollCategoryController.position.maxScrollExtent - 100) {
      if (!isFetchingCategory.value && hasMoreCategoryData.value) {
        fetchCategoryApi();
      }
    }
  }

  void _scrollProductListener() {
    if (scrollProductController.position.pixels ==
        scrollProductController.position.maxScrollExtent) {
      if (!isFetchingProduct.value &&
          (productMetadata.value.page! < productMetadata.value.maxPage!)) {
        fetchProductApi(
          categoryId: categoryData[selectedCategoryIndex.value].sId!,
          page: productMetadata.value.page! + 1,
        );
      }
    }
  }

  @override
  void dispose() {
    scrollCategoryController.dispose();
    scrollProductController.dispose();
    super.dispose();
  }
}
