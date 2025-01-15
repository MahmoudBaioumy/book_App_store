class AllcategoriesModel {
  Data? _data;
  String? _message;
  List<Null>? _error;
  int? _status;

  AllcategoriesModel(
      {Data? data, String? message, List<Null>? error, int? status}) {
    if (data != null) {
      this._data = data;
    }
    if (message != null) {
      this._message = message;
    }
    if (error != null) {
      this._error = error;
    }
    if (status != null) {
      this._status = status;
    }
  }

  Data? get data => _data;
  set data(Data? data) => _data = data;
  String? get message => _message;
  set message(String? message) => _message = message;
  List<Null>? get error => _error;
  set error(List<Null>? error) => _error = error;
  int? get status => _status;
  set status(int? status) => _status = status;

  AllcategoriesModel.fromJson(Map<String, dynamic> json) {
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    _message = json['message'];
    if (json['error'] != null) {
      _error = <Null>[];
      json['error'].forEach((v) {
        _error!.add(v);
      });
    }
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    data['message'] = this._message;
    if (this._error != null) {
      data['error'] = this._error!.map((v) => v).toList();
    }
    data['status'] = this._status;
    return data;
  }
}

class Data {
  int? _id;
  String? _name;
  String? _slug;
  List<Products>? _products;

  Data({int? id, String? name, String? slug, List<Products>? products}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (slug != null) {
      this._slug = slug;
    }
    if (products != null) {
      this._products = products;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  List<Products>? get products => _products;
  set products(List<Products>? products) => _products = products;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    if (json['products'] != null) {
      _products = <Products>[];
      json['products'].forEach((v) {
        _products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['slug'] = this._slug;
    if (this._products != null) {
      data['products'] = this._products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? _id;
  String? _name;
  String? _description;
  int? _stock;
  String? _price;
  int? _bestSeller;
  int? _discount;
  double? _priceAfterDiscount;
  String? _image;

  Products(
      {int? id,
      String? name,
      String? description,
      int? stock,
      String? price,
      int? bestSeller,
      int? discount,
      double? priceAfterDiscount,
      String? image}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (description != null) {
      this._description = description;
    }
    if (stock != null) {
      this._stock = stock;
    }
    if (price != null) {
      this._price = price;
    }
    if (bestSeller != null) {
      this._bestSeller = bestSeller;
    }
    if (discount != null) {
      this._discount = discount;
    }
    if (priceAfterDiscount != null) {
      this._priceAfterDiscount = priceAfterDiscount;
    }
    if (image != null) {
      this._image = image;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;
  int? get stock => _stock;
  set stock(int? stock) => _stock = stock;
  String? get price => _price;
  set price(String? price) => _price = price;
  int? get bestSeller => _bestSeller;
  set bestSeller(int? bestSeller) => _bestSeller = bestSeller;
  int? get discount => _discount;
  set discount(int? discount) => _discount = discount;
  double? get priceAfterDiscount => _priceAfterDiscount;
  set priceAfterDiscount(double? priceAfterDiscount) =>
      _priceAfterDiscount = priceAfterDiscount;
  String? get image => _image;
  set image(String? image) => _image = image;

  Products.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _stock = json['stock'];
    _price = json['price'];
    _bestSeller = json['best_seller'];
    _discount = json['discount'];
    _priceAfterDiscount = json['price_after_discount'];
    _image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['description'] = this._description;
    data['stock'] = this._stock;
    data['price'] = this._price;
    data['best_seller'] = this._bestSeller;
    data['discount'] = this._discount;
    data['price_after_discount'] = this._priceAfterDiscount;
    data['image'] = this._image;
    return data;
  }
}
