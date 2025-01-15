class categoriesModel {
  Data? _data;
  String? _message;
  List<Null>? _error;
  int? _status;

  categoriesModel(
      {Data? data, String? message, List<Null>? error, int? status}) {
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

  categoriesModel.fromJson(Map<String, dynamic> json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
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
  List<Categories>? _categories;
  Meta? _meta;
  Links? _links;

  Data({List<Categories>? categories, Meta? meta, Links? links}) {
    if (categories != null) {
      _categories = categories;
    }
    if (meta != null) {
      _meta = meta;
    }
    if (links != null) {
      _links = links;
    }
  }

  List<Categories>? get categories => _categories;
  set categories(List<Categories>? categories) => _categories = categories;
  Meta? get meta => _meta;
  set meta(Meta? meta) => _meta = meta;
  Links? get links => _links;
  set links(Links? links) => _links = links;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      _categories = <Categories>[];
      json['categories'].forEach((v) {
        _categories!.add(Categories.fromJson(v));
      });
    }
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_categories != null) {
      data['categories'] = _categories!.map((v) => v.toJson()).toList();
    }
    if (_meta != null) {
      data['meta'] = _meta!.toJson();
    }
    if (_links != null) {
      data['links'] = _links!.toJson();
    }
    return data;
  }
}

class Categories {
  int? _id;
  String? _name;
  int? _productsCount;

  Categories({int? id, String? name, int? productsCount}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (productsCount != null) {
      _productsCount = productsCount;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get productsCount => _productsCount;
  set productsCount(int? productsCount) => _productsCount = productsCount;

  Categories.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _productsCount = json['products_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['products_count'] = _productsCount;
    return data;
  }
}

class Meta {
  int? _total;
  int? _perPage;
  int? _currentPage;
  int? _lastPage;

  Meta({int? total, int? perPage, int? currentPage, int? lastPage}) {
    if (total != null) {
      _total = total;
    }
    if (perPage != null) {
      _perPage = perPage;
    }
    if (currentPage != null) {
      _currentPage = currentPage;
    }
    if (lastPage != null) {
      _lastPage = lastPage;
    }
  }

  int? get total => _total;
  set total(int? total) => _total = total;
  int? get perPage => _perPage;
  set perPage(int? perPage) => _perPage = perPage;
  int? get currentPage => _currentPage;
  set currentPage(int? currentPage) => _currentPage = currentPage;
  int? get lastPage => _lastPage;
  set lastPage(int? lastPage) => _lastPage = lastPage;

  Meta.fromJson(Map<String, dynamic> json) {
    _total = json['total'];
    _perPage = json['per_page'];
    _currentPage = json['current_page'];
    _lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = _total;
    data['per_page'] = _perPage;
    data['current_page'] = _currentPage;
    data['last_page'] = _lastPage;
    return data;
  }
}

class Links {
  String? _first;
  String? _last;
  Null _prev;
  Null _next;

  Links({String? first, String? last, Null prev, Null next}) {
    if (first != null) {
      _first = first;
    }
    if (last != null) {
      _last = last;
    }
    if (prev != null) {
      _prev = prev;
    }
    if (next != null) {
      _next = next;
    }
  }

  String? get first => _first;
  set first(String? first) => _first = first;
  String? get last => _last;
  set last(String? last) => _last = last;
  Null get prev => _prev;
  set prev(Null prev) => _prev = prev;
  Null get next => _next;
  set next(Null next) => _next = next;

  Links.fromJson(Map<String, dynamic> json) {
    _first = json['first'];
    _last = json['last'];
    _prev = json['prev'];
    _next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = _first;
    data['last'] = _last;
    data['prev'] = _prev;
    data['next'] = _next;
    return data;
  }
}
