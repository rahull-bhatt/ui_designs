class CategoryModel {
  bool? status;
  String? message;
  List<CategoryResult>? result;

  CategoryModel({status, message, result});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      result = <CategoryResult>[];
      json['data'].forEach((v) {
        result!.add(CategoryResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (result != null) {
      data['data'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryResult {
  List<Metadata>? metadata;
  List<CategoryData>? categoryData;

  CategoryResult({metadata, categoryData});

  CategoryResult.fromJson(Map<String, dynamic> json) {
    if (json['metadata'] != null) {
      metadata = <Metadata>[];
      json['metadata'].forEach((v) {
        metadata!.add(Metadata.fromJson(v));
      });
    }
    if (json['data'] != null) {
      categoryData = <CategoryData>[];
      json['data'].forEach((v) {
        categoryData!.add(CategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (metadata != null) {
      data['metadata'] = metadata!.map((v) => v.toJson()).toList();
    }
    if (categoryData != null) {
      data['data'] = categoryData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metadata {
  int? total;
  int? page;
  int? maxPage;

  Metadata({total, page, maxPage});

  Metadata.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    maxPage = json['maxPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total'] = total;
    data['page'] = page;
    data['maxPage'] = maxPage;
    return data;
  }
}

class CategoryData {
  String? sId;
  String? name;
  AImage? image;
  int? sort;

  CategoryData({sId, name, image, sort});

  CategoryData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'] != null ? AImage.fromJson(json['image']) : null;
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['sort'] = sort;
    return data;
  }
}

class AImage {
  String? url;
  String? file;

  AImage({url, file});

  AImage.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = url;
    data['file'] = file;
    return data;
  }
}

/// product response model

class ProductResponseModel {
  String? status;
  String? message;
  ProductResult? result;

  ProductResponseModel({status, message, result});

  ProductResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result =
        json['result'] != null ? ProductResult.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class ProductResult {
  List<Metadata>? metadata;
  List<ProductData>? productData;

  ProductResult({metadata, productData});

  ProductResult.fromJson(Map<String, dynamic> json) {
    if (json['metadata'] != null) {
      metadata = <Metadata>[];
      json['metadata'].forEach((v) {
        metadata!.add(Metadata.fromJson(v));
      });
    }
    if (json['data'] != null) {
      productData = <ProductData>[];
      json['data'].forEach((v) {
        productData!.add(ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (metadata != null) {
      data['metadata'] = metadata!.map((v) => v.toJson()).toList();
    }
    if (productData != null) {
      data['data'] = productData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductData {
  String? sId;
  String? storeId;
  String? categoryId;
  String? name;
  String? description;
  List<AImage>? image;
  List<String>? tags;
  List<Variants>? variants;
  Rating? rating;
  AvailableTime? availableTime;

  ProductData({
    sId,
    storeId,
    categoryId,
    name,
    description,
    image,
    tags,
    variants,
    rating,
    availableTime,
  });

  ProductData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    storeId = json['storeId'];
    categoryId = json['categoryId'];
    name = json['name'];
    description = json['description'];
    if (json['image'] != null) {
      image = <AImage>[];
      json['image'].forEach((v) {
        image!.add(AImage.fromJson(v));
      });
    }
    tags = json['tags'].cast<String>();
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(Variants.fromJson(v));
      });
    }
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
    availableTime =
        json['availableTime'] != null
            ? AvailableTime.fromJson(json['availableTime'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['storeId'] = storeId;
    data['categoryId'] = categoryId;
    data['name'] = name;
    data['description'] = description;
    if (image != null) {
      data['image'] = image!.map((v) => v.toJson()).toList();
    }
    data['tags'] = tags;
    if (variants != null) {
      data['variants'] = variants!.map((v) => v.toJson()).toList();
    }
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    if (availableTime != null) {
      data['availableTime'] = availableTime!.toJson();
    }
    return data;
  }
}

class Variants {
  String? discountType;
  num? discount;
  num? mrp;
  num? price;
  num? sKU;
  num? sort;
  String? weightOrCount;
  String? sId;

  Variants({discountType, discount, mrp, price, sKU, sort, weightOrCount, sId});

  Variants.fromJson(Map<String, dynamic> json) {
    discountType = json['discountType'];
    discount = json['discount'];
    mrp = json['mrp'];
    price = json['price'];
    sKU = json['SKU'];
    sort = json['sort'];
    weightOrCount = json['weightOrCount'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['discountType'] = discountType;
    data['discount'] = discount;
    data['mrp'] = mrp;
    data['price'] = price;
    data['SKU'] = sKU;
    data['sort'] = sort;
    data['weightOrCount'] = weightOrCount;
    data['_id'] = sId;
    return data;
  }
}

class Rating {
  int? averageRating;
  int? totalRatings;

  Rating({averageRating, totalRatings});

  Rating.fromJson(Map<String, dynamic> json) {
    averageRating = json['averageRating'];
    totalRatings = json['totalRatings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['averageRating'] = averageRating;
    data['totalRatings'] = totalRatings;
    return data;
  }
}

class AvailableTime {
  String? closeTime;
  String? openTime;
  bool? status;

  AvailableTime({closeTime, openTime, status});

  AvailableTime.fromJson(Map<String, dynamic> json) {
    closeTime = json['closeTime'];
    openTime = json['openTime'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['closeTime'] = closeTime;
    data['openTime'] = openTime;
    data['status'] = status;
    return data;
  }
}
