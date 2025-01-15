class favModel {
  Data? _data;
  String? _message;
  List<Null>? _error;
  int? _status;

  favModel({Data? data, String? message, List<Null>? error, int? status}) {
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

  favModel.fromJson(Map<String, dynamic> json) {
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
  int? _currentPage;
  List<Null>? _data;
  String? _firstPageUrl;
  Null _from;
  int? _lastPage;
  String? _lastPageUrl;
  List<Links>? _links;
  Null _nextPageUrl;
  String? _path;
  int? _perPage;
  Null _prevPageUrl;
  Null _to;
  int? _total;

  Data(
      {int? currentPage,
      List<Null>? data,
      String? firstPageUrl,
      Null from,
      int? lastPage,
      String? lastPageUrl,
      List<Links>? links,
      Null nextPageUrl,
      String? path,
      int? perPage,
      Null prevPageUrl,
      Null to,
      int? total}) {
    if (currentPage != null) {
      _currentPage = currentPage;
    }
    if (data != null) {
      _data = data;
    }
    if (firstPageUrl != null) {
      _firstPageUrl = firstPageUrl;
    }
    if (from != null) {
      _from = from;
    }
    if (lastPage != null) {
      _lastPage = lastPage;
    }
    if (lastPageUrl != null) {
      _lastPageUrl = lastPageUrl;
    }
    if (links != null) {
      _links = links;
    }
    if (nextPageUrl != null) {
      _nextPageUrl = nextPageUrl;
    }
    if (path != null) {
      _path = path;
    }
    if (perPage != null) {
      _perPage = perPage;
    }
    if (prevPageUrl != null) {
      _prevPageUrl = prevPageUrl;
    }
    if (to != null) {
      _to = to;
    }
    if (total != null) {
      _total = total;
    }
  }

  int? get currentPage => _currentPage;
  set currentPage(int? currentPage) => _currentPage = currentPage;
  List<Null>? get data => _data;
  set data(List<Null>? data) => _data = data;
  String? get firstPageUrl => _firstPageUrl;
  set firstPageUrl(String? firstPageUrl) => _firstPageUrl = firstPageUrl;
  Null get from => _from;
  set from(Null from) => _from = from;
  int? get lastPage => _lastPage;
  set lastPage(int? lastPage) => _lastPage = lastPage;
  String? get lastPageUrl => _lastPageUrl;
  set lastPageUrl(String? lastPageUrl) => _lastPageUrl = lastPageUrl;
  List<Links>? get links => _links;
  set links(List<Links>? links) => _links = links;
  Null get nextPageUrl => _nextPageUrl;
  set nextPageUrl(Null nextPageUrl) => _nextPageUrl = nextPageUrl;
  String? get path => _path;
  set path(String? path) => _path = path;
  int? get perPage => _perPage;
  set perPage(int? perPage) => _perPage = perPage;
  Null get prevPageUrl => _prevPageUrl;
  set prevPageUrl(Null prevPageUrl) => _prevPageUrl = prevPageUrl;
  Null get to => _to;
  set to(Null to) => _to = to;
  int? get total => _total;
  set total(int? total) => _total = total;

  Data.fromJson(Map<String, dynamic> json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = <Null>[];
      json['data'].forEach((v) {
        _data!.add(v);
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      _links = <Links>[];
      json['links'].forEach((v) {
        _links!.add(Links.fromJson(v));
      });
    }
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = _currentPage;
    if (_data != null) {
      data['data'] = _data!.map((v) => v).toList();
    }
    data['first_page_url'] = _firstPageUrl;
    data['from'] = _from;
    data['last_page'] = _lastPage;
    data['last_page_url'] = _lastPageUrl;
    if (_links != null) {
      data['links'] = _links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = _nextPageUrl;
    data['path'] = _path;
    data['per_page'] = _perPage;
    data['prev_page_url'] = _prevPageUrl;
    data['to'] = _to;
    data['total'] = _total;
    return data;
  }
}

class Links {
  String? _url;
  String? _label;
  bool? _active;

  Links({String? url, String? label, bool? active}) {
    if (url != null) {
      _url = url;
    }
    if (label != null) {
      _label = label;
    }
    if (active != null) {
      _active = active;
    }
  }

  String? get url => _url;
  set url(String? url) => _url = url;
  String? get label => _label;
  set label(String? label) => _label = label;
  bool? get active => _active;
  set active(bool? active) => _active = active;

  Links.fromJson(Map<String, dynamic> json) {
    _url = json['url'];
    _label = json['label'];
    _active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = _url;
    data['label'] = _label;
    data['active'] = _active;
    return data;
  }
}
