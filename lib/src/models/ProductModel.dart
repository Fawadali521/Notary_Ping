// ignore_for_file: file_names

class ProductModel {
  String? id;
  String? title;
  String? subTitle;
  String? description;
  String? image;
  String? primeCategory;
  String? subCategory;
  String? sku;
  String? barcode;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.image,
    this.subTitle,
    this.primeCategory,
    this.subCategory,
    this.sku,
    this.barcode,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        subTitle: json["subTitle"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "subTitle": subTitle,
      };
}
