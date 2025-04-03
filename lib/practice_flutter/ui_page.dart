// Obx(() => ListView.builder(
// controller: productController.scrollController, // ✅ Attach ScrollController
// itemCount: productController.productList.length,
// itemBuilder: (context, index) {
// var product = productController.productList[index];
// return ListTile(
// title: Text(product.title),
// subtitle: Text("\$${product.price}"),
// );
// },
// ));
