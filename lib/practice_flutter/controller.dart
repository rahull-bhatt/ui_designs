// class ProductController extends GetxController {
//   var isLoading = false.obs;
//   var productList = <Product>[].obs;
//   ScrollController scrollController = ScrollController();
//   int page = 1;
//   bool hasMoreData = true;
//
//   @override
//   void onInit() {
//     fetchProducts();
//     scrollController.addListener(() {
//       if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
//         fetchProducts(); // Load more data when scrolled to bottom
//       }
//     });
//     super.onInit();
//   }
//
//   void fetchProducts() async {
//     if (!hasMoreData) return;
//     try {
//       isLoading.value = true;
//       var response = await http.get(Uri.parse('https://fakestoreapi.com/products?page=$page'));
//
//       if (response.statusCode == 200) {
//         var jsonResponse = json.decode(response.body);
//         var products = jsonResponse.map<Product>((json) => Product.fromJson(json)).toList();
//
//         if (products.isNotEmpty) {
//           productList.addAll(products);
//           page++;
//         } else {
//           hasMoreData = false;
//         }
//       }
//     } catch (e) {
//       print("Error: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
