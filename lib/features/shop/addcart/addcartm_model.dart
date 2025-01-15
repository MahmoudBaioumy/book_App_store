class AddCartModel {
  Data? _data;
  String? _message;
  List<Null>? _error;
  int? _status;

  AddCartModel({Data? data, String? message, List<Null>? error, int? status}) {
    if (data != null) {
      _data = data;
    }
    if (message != null) {
      _message = message;
    }
    if (error != null) {
      _error = error;
    }
    if (status != null) {
      _status = status;
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

  AddCartModel.fromJson(Map<String, dynamic> json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
    if (json['error'] != null) {
      _error = <Null>[];
      json['error'].forEach((v) {
        _error!.add((v));
      });
    }
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_data != null) {
      data['data'] = _data!.toJson();
    }
    data['message'] = _message;
    if (_error != null) {
      data['error'] = _error!.map((v) => v).toList();
    }
    data['status'] = _status;
    return data;
  }
}

class Data {
  int? _id;
  User? _user;
  String? _total;
  List<CartItems>? _cartItems;

  Data({int? id, User? user, String? total, List<CartItems>? cartItems}) {
    if (id != null) {
      _id = id;
    }
    if (user != null) {
      _user = user;
    }
    if (total != null) {
      _total = total;
    }
    if (cartItems != null) {
      _cartItems = cartItems;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  User? get user => _user;
  set user(User? user) => _user = user;
  String? get total => _total;
  set total(String? total) => _total = total;
  List<CartItems>? get cartItems => _cartItems;
  set cartItems(List<CartItems>? cartItems) => _cartItems = cartItems;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _total = json['total'];
    if (json['cart_items'] != null) {
      _cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        _cartItems!.add(CartItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    if (_user != null) {
      data['user'] = _user!.toJson();
    }
    data['total'] = _total;
    if (_cartItems != null) {
      data['cart_items'] = _cartItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? _userId;
  String? _userName;

  User({int? userId, String? userName}) {
    if (userId != null) {
      _userId = userId;
    }
    if (userName != null) {
      _userName = userName;
    }
  }

  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  String? get userName => _userName;
  set userName(String? userName) => _userName = userName;

  User.fromJson(Map<String, dynamic> json) {
    _userId = json['user_id'];
    _userName = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = _userId;
    data['user_name'] = _userName;
    return data;
  }
}

class CartItems {
  int? _itemId;
  int? _itemProductId;
  String? _itemProductName;
  String? _itemProductImage;
  String? _itemProductPrice;
  int? _itemProductDiscount;
  double? _itemProductPriceAfterDiscount;
  int? _itemProductStock;
  int? _itemQuantity;
  double? _itemTotal;

  CartItems(
      {int? itemId,
      int? itemProductId,
      String? itemProductName,
      String? itemProductImage,
      String? itemProductPrice,
      int? itemProductDiscount,
      double? itemProductPriceAfterDiscount,
      int? itemProductStock,
      int? itemQuantity,
      double? itemTotal}) {
    if (itemId != null) {
      _itemId = itemId;
    }
    if (itemProductId != null) {
      _itemProductId = itemProductId;
    }
    if (itemProductName != null) {
      _itemProductName = itemProductName;
    }
    if (itemProductImage != null) {
      _itemProductImage = itemProductImage;
    }
    if (itemProductPrice != null) {
      _itemProductPrice = itemProductPrice;
    }
    if (itemProductDiscount != null) {
      _itemProductDiscount = itemProductDiscount;
    }
    if (itemProductPriceAfterDiscount != null) {
      _itemProductPriceAfterDiscount = itemProductPriceAfterDiscount;
    }
    if (itemProductStock != null) {
      _itemProductStock = itemProductStock;
    }
    if (itemQuantity != null) {
      _itemQuantity = itemQuantity;
    }
    if (itemTotal != null) {
      _itemTotal = itemTotal;
    }
  }

  int? get itemId => _itemId;
  set itemId(int? itemId) => _itemId = itemId;
  int? get itemProductId => _itemProductId;
  set itemProductId(int? itemProductId) => _itemProductId = itemProductId;
  String? get itemProductName => _itemProductName;
  set itemProductName(String? itemProductName) =>
      _itemProductName = itemProductName;
  String? get itemProductImage => _itemProductImage;
  set itemProductImage(String? itemProductImage) =>
      _itemProductImage = itemProductImage;
  String? get itemProductPrice => _itemProductPrice;
  set itemProductPrice(String? itemProductPrice) =>
      _itemProductPrice = itemProductPrice;
  int? get itemProductDiscount => _itemProductDiscount;
  set itemProductDiscount(int? itemProductDiscount) =>
      _itemProductDiscount = itemProductDiscount;
  double? get itemProductPriceAfterDiscount => _itemProductPriceAfterDiscount;
  set itemProductPriceAfterDiscount(double? itemProductPriceAfterDiscount) =>
      _itemProductPriceAfterDiscount = itemProductPriceAfterDiscount;
  int? get itemProductStock => _itemProductStock;
  set itemProductStock(int? itemProductStock) =>
      _itemProductStock = itemProductStock;
  int? get itemQuantity => _itemQuantity;
  set itemQuantity(int? itemQuantity) => _itemQuantity = itemQuantity;
  double? get itemTotal => _itemTotal;
  set itemTotal(double? itemTotal) => _itemTotal = itemTotal;

  CartItems.fromJson(Map<String, dynamic> json) {
    _itemId = json['item_id'];
    _itemProductId = json['item_product_id'];
    _itemProductName = json['item_product_name'];
    _itemProductImage = json['item_product_image'];
    _itemProductPrice = json['item_product_price'];
    _itemProductDiscount = json['item_product_discount'];
    _itemProductPriceAfterDiscount = json['item_product_price_after_discount'];
    _itemProductStock = json['item_product_stock'];
    _itemQuantity = json['item_quantity'];
    _itemTotal = json['item_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = _itemId;
    data['item_product_id'] = _itemProductId;
    data['item_product_name'] = _itemProductName;
    data['item_product_image'] = _itemProductImage;
    data['item_product_price'] = _itemProductPrice;
    data['item_product_discount'] = _itemProductDiscount;
    data['item_product_price_after_discount'] = _itemProductPriceAfterDiscount;
    data['item_product_stock'] = _itemProductStock;
    data['item_quantity'] = _itemQuantity;
    data['item_total'] = _itemTotal;
    return data;
  }
}
