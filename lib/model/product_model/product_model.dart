

class ProductsModel{
  ProductsData? data;
  String? message;
  List? error=[];
  int? status;

  ProductsModel({this.data,this.message,this.error,this.status});

  ProductsModel.fromJson(Map<String,dynamic> json)
  {
    data = json["data"] != null? ProductsData.fromJson(json["data"]) : null;
    message = json["message"];
    status=json["status"];
    for(var i in json["error"])
      {
        error?.add(i);
      }
  }
}

class ProductsData{
  List<Product>? products = [];

  ProductsData({this.products});

  ProductsData.fromJson(Map<String,dynamic> json)
  {
    for(var i in json["products"])
      {
            products?.add(Product.fromJson(i));
      }
  }
}

class Product{
  int? id;
  String? name;
  String? description;
  String? price;
  int? discount;
  double? price_after_discount;
  int? stock;
  int? best_seller;
  String? image;
  String? category;

  Product({this.id,this.name,this.description,this.price,
  this.discount,this.price_after_discount,this.stock,this.best_seller,
  this.image,this.category});

  Product.fromJson(Map<String,dynamic> json)
  {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    price=json["price"];
    discount = json["discount"];
    price_after_discount = json["price_after_discount"];
    stock=json["stock"];
    best_seller =json["best_seller"];
    image= json["image"];
    category = json["category"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['category'] = this.category;
    data['image'] = this.image;
    data['discount'] = this.discount;
    data['stock'] = this.stock;
    data['description'] = this.description;
    data['best_seller'] = this.best_seller;
    return data;
  }
}

