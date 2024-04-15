import 'package:book_store/model/product_model/product_model.dart';

class FavouriteModel {
  FavouriteData? data;
  String? message;
  List? error;
  int? status;

  FavouriteModel({this.data, this.message, this.error, this.status});

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new FavouriteData.fromJson(json['data']) : null;
    message = json['message'];
    for(var i in json["error"])
    {
      error?.add(i);
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    if (this.error != null) {
      data['error'] = this.error!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class FavouriteData {
  int? currentPage;
  List<Product>? dataList;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  FavouriteData(
      {this.currentPage,
        this.dataList,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  FavouriteData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      dataList = <Product>[];
      json['data'].forEach((v) {
        dataList!.add(new Product.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.dataList != null) {
      data['data'] = this.dataList!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

// class Data {
//   int? id;
//   String? name;
//   String? price;
//   String? category;
//   String? image;
//   int? discount;
//   int? stock;
//   String? description;
//   int? bestSeller;
//
//   Data(
//       {this.id,
//         this.name,
//         this.price,
//         this.category,
//         this.image,
//         this.discount,
//         this.stock,
//         this.description,
//         this.bestSeller});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     price = json['price'];
//     category = json['category'];
//     image = json['image'];
//     discount = json['discount'];
//     stock = json['stock'];
//     description = json['description'];
//     bestSeller = json['best_seller'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['price'] = this.price;
//     data['category'] = this.category;
//     data['image'] = this.image;
//     data['discount'] = this.discount;
//     data['stock'] = this.stock;
//     data['description'] = this.description;
//     data['best_seller'] = this.bestSeller;
//     return data;
//   }
// }

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}