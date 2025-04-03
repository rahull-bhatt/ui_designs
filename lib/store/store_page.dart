import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_designs/store/store_controller.dart';

class StorePage extends StatelessWidget {
  final StoreController controller = Get.put(StoreController());

  StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final wth = Get.size.width;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: Icon(Icons.arrow_back_ios_new),
        title: Text(
          "PARADISE HOTEL & RESTAURANT",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 12),
            height: 20,
            width: 39,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.green,
            ),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '5.0',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 1),
                  Icon(Icons.star, color: Colors.white, size: 12),
                ],
              ),
            ),
          ),
        ],
        shape: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: Colors.black.withOpacity(0.1),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Row(
        children: [
          SizedBox(
            width: wth * 0.2,
            child: Obx(
              () => ListView.builder(
                physics: BouncingScrollPhysics(),
                controller: controller.scrollCategoryController,
                itemCount: controller.categoryData.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      controller.selectedCategoryIndex.value = index;
                      controller.productData.clear();
                      controller.productCallApi(
                        controller.categoryData[index].sId ?? '',
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 2),
                          decoration: BoxDecoration(color: Colors.white),
                          child: Column(
                            children: [
                              Image.network(
                                controller.categoryData[index].image?.url ?? '',
                                fit: BoxFit.cover,
                                height: 60,
                                width: 60,
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                        Icon(Icons.broken_image),
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 6),
                                  child: Text(
                                    controller.categoryData[index].name ?? "",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //  Show red line for selected category
                        Obx(
                          () =>
                              controller.selectedCategoryIndex.value == index
                                  ? Positioned(
                                    right: 0,
                                    top: 8,
                                    bottom: 8,
                                    child: Container(
                                      width: 4,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                        color: Colors.red.shade800,
                                      ),
                                    ),
                                  )
                                  : SizedBox(),
                        ), //  No line when not selected
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            height: Get.size.height,
            width: 1.5,
            decoration: BoxDecoration(color: Colors.grey.shade200),
          ),
          SizedBox(width: 5),
          Expanded(
            child: ListView(
              shrinkWrap: false,
              physics: BouncingScrollPhysics(),
              controller: controller.scrollProductController,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 7,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.black),
                          hintText: "Search for items in shop",
                          hintStyle: TextStyle(fontSize: 11),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blueGrey.withOpacity(0.18),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blueGrey.withOpacity(0.18),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Products',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Obx(
                      () =>
                          controller.isFetchingProduct.value
                              ? Center(child: CircularProgressIndicator())
                              : GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.all(10),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 15,
                                      childAspectRatio: 0.5,
                                    ),
                                itemCount: controller.productData.length,
                                itemBuilder: (context, index) {
                                  var product = controller.productData[index];
                                  return Column(
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            child: AspectRatio(
                                              aspectRatio: 1,
                                              child: Image.network(
                                                product.image?[0].url ?? '',
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                                errorBuilder:
                                                    (
                                                      context,
                                                      error,
                                                      stackTrace,
                                                    ) => Icon(
                                                      Icons.broken_image,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: -5,
                                            right: 0,
                                            child: Container(
                                              height: 30,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Colors.green,
                                                  width: 1,
                                                ),
                                                color: Colors.white,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'ADD',
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 5,
                                            vertical: 5,
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.grey.shade200,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(3),
                                              child: Text(
                                                controller
                                                        .productData[index]
                                                        .variants?[0]
                                                        .weightOrCount ??
                                                    '',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 2,
                                          ),
                                          child: Text(
                                            controller
                                                    .productData[index]
                                                    .name ??
                                                "",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 2),
                                          child: Text(
                                            "${controller.productData[index].variants?[0].discount}%OFF",
                                            style: TextStyle(
                                              color: Colors.blueAccent.shade700,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 3,
                                              ),
                                              child: Text(
                                                "₹ ${controller.productData[index].variants?[0].price}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 1),
                                          Text(
                                            'MRP',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                          SizedBox(width: 2),
                                          Text(
                                            "₹${controller.productData[index].variants?[0].mrp}",
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.blueGrey,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
