// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final int id;
  final String name;
  final String image;
  final int discount;
  final String subCategory;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.discount,
    required this.subCategory,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? image,
    int? discount,
    String? subCategory,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      discount: discount ?? this.discount,
      subCategory: subCategory ?? this.subCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'discount': discount,
      'subCategory': subCategory,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      discount: map['discount'] as int,
      subCategory: map['sub-category']['name'] as String, // Access nested field
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  // Add fromJsonList method to handle list of products
  static List<ProductModel> fromJsonList(List<dynamic> data) {
    return data.map((json) => ProductModel.fromMap(json)).toList();
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, image: $image, discount: $discount, subCategory: $subCategory)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.image == image &&
        other.discount == discount &&
        other.subCategory == subCategory;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        discount.hashCode ^
        subCategory.hashCode;
  }
}
