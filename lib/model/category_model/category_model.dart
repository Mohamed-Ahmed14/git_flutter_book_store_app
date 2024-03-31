class CategoryModel{
  CategoryData? data;
  String? message;
  List? error = [];
  int? status;

  CategoryModel({this.data,this.status,this.error,this.message});

  CategoryModel.fromJson(Map<String,dynamic> json)
  {
    data = json["data"] != null? CategoryData.fromJson(json["data"]) : null;
    message = json["message"];
    status = json["status"];
    for(var i in json["error"])
      {
        error?.add(i);
      }
  }


}

class CategoryData{
  List<Category>? category=[];
  Meta? meta;
  Link? link;

  CategoryData({this.category,this.meta,this.link});

  CategoryData.fromJson(Map<String,dynamic> json)
  {
    for(var i in json["categories"])
      {
        category?.add(Category.fromJson(i));
      }
    meta = json["meta"] != null ? Meta.fromJson(json["meta"]) : null;
    link = json["link"] != null ? Link.fromJson(json["link"]) : null;
  }

}

class Category{
  int? id;
  String? name;
  int? products_count;

  Category({this.id,this.name,this.products_count});

  Category.fromJson(Map<String,dynamic> json)
  {
    id = json["id"];
    name = json["name"];
    products_count = json["products_count"];
  }
}

class Meta{
  int? total;
  int? per_page;
  int? current_page;
  int? last_page;

  Meta({this.total,this.per_page,this.current_page,this.last_page});

  Meta.fromJson(Map<String,dynamic> json)
  {
    total = json["total"];
    per_page = json["per_page"];
    current_page = json["current_page"];
    last_page = json["last_page"];
  }
}

class Link{
  String? first;
  String? last;
  String? prev;
  String? next;

  Link({this.first,this.last,this.next,this.prev});

  Link.fromJson(Map<String,dynamic> json)
  {
    first = json["first"];
    last = json["last"];
    prev = json["prev"];
    next = json["next"];
  }

}