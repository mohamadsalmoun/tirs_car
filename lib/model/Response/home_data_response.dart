
class HomeDataResponse {
  HomeDataResponse({
    this.success,
    this.data,
    this.message,
    this.code,
  });

  bool success;
  Data data;
  String message;
  dynamic code;

  factory HomeDataResponse.fromJson(Map<String, dynamic> json) => HomeDataResponse(
    success: json["success"] == null ? null : json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"] == null ? null : json["message"],
    code: json["code"] == null ? null : json["code"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "data": data == null ? null : data.toJson(),
    "message": message == null ? null : message,
    "code": code == null ? null : code,
  };
}

class Data {
  Data({
    this.sliders,
    this.imgOffer,
    this.cats,
    this.latestProducts,
    this.proMoreArr,
  });

  List<Sliderr> sliders;
  String imgOffer;
  List<Cat> cats;
  List<LatestProduct> latestProducts;
  List<LatestProduct> proMoreArr;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    sliders: json["sliders"] == null ? null : List<Sliderr>.from(json["sliders"].map((x) => Sliderr.fromJson(x))),
    imgOffer: json["img_offer"] == null ? null : json["img_offer"],
    cats: json["cats"] == null ? null : List<Cat>.from(json["cats"].map((x) => Cat.fromJson(x))),
    latestProducts: json["latest_products"] == null ? null : List<LatestProduct>.from(json["latest_products"].map((x) => LatestProduct.fromJson(x))),
    proMoreArr: json["pro_more_arr"] == null ? null : List<LatestProduct>.from(json["pro_more_arr"].map((x) => LatestProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sliders": sliders == null ? null : List<dynamic>.from(sliders.map((x) => x.toJson())),
    "img_offer": imgOffer == null ? null : imgOffer,
    "cats": cats == null ? null : List<dynamic>.from(cats.map((x) => x.toJson())),
    "latest_products": latestProducts == null ? null : List<dynamic>.from(latestProducts.map((x) => x.toJson())),
    "pro_more_arr": proMoreArr == null ? null : List<dynamic>.from(proMoreArr.map((x) => x.toJson())),
  };
}

class Cat {
  Cat({
    this.id,
    this.title,
    this.image,
  });

  int id;
  String title;
  String image;

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "image": image == null ? null : image,
  };
}

class LatestProduct {
  LatestProduct({
    this.id,
    this.title,
    this.price,
    this.favorite,
    this.image,
  });

  int id;
  String title;
  dynamic price;
  bool favorite;
  String image;

  factory LatestProduct.fromJson(Map<String, dynamic> json) => LatestProduct(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    price: json["price"] == null ? null : json["price"],
    favorite: json["favorite"] == null ? null : json["favorite"],
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "price": price == null ? null : price,
    "favorite": favorite == null ? null : favorite,
    "image": image == null ? null : image,
  };
}

class Sliderr {
  Sliderr({
    this.id,
    this.title,
    this.text,
    this.link,
    this.image,
  });

  int id;
  String title;
  String text;
  String link;
  String image;

  factory Sliderr.fromJson(Map<String, dynamic> json) => Sliderr(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    text: json["text"] == null ? null : json["text"],
    link: json["link"] == null ? null : json["link"],
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "text": text == null ? null : text,
    "link": link == null ? null : link,
    "image": image == null ? null : image,
  };
}










class ErrorResponse {
  ErrorResponse({
    this.success,
    this.code,
    this.message,
  });

  bool success;
  dynamic code;
  String message;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
    success: json["success"] == null ? null : json["success"],
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "code": code == null ? null : code,
    "message": message == null ? null : message,
  };
}
