class InfoModel {
  Data? data;
  String? message;
  List<Null>? error;
  int? status;

  InfoModel({this.data, this.message, this.error, this.status});

  InfoModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    if (json['error'] != null) {
      error = <Null>[];
      json['error'].forEach((v) {
        error!.add((v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    if (error != null) {
      data['error'] = error!.map((v) => v).toList();
    }
    data['status'] = status;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  int? stock;
  int? bestSeller;
  String? price;
  int? discount;
  double? priceAfterDiscount;
  String? image;
  String? category;

  Data(
      {this.id,
      this.name,
      this.description,
      this.stock,
      this.bestSeller,
      this.price,
      this.discount,
      this.priceAfterDiscount,
      this.image,
      this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    stock = json['stock'];
    bestSeller = json['best_seller'];
    price = json['price'];
    discount = json['discount'];
    priceAfterDiscount = json['price_after_discount'];
    image = json['image'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['stock'] = stock;
    data['best_seller'] = bestSeller;
    data['price'] = price;
    data['discount'] = discount;
    data['price_after_discount'] = priceAfterDiscount;
    data['image'] = image;
    data['category'] = category;
    return data;
  }
}
