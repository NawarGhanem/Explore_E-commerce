import 'dart:convert';

class CategoriesModel {
  final int id;
  final String name;

  CategoriesModel({
    required this.id,
    required this.name,
  });

  CategoriesModel copyWith({
    int? id,
    String? name,
  }) {
    return CategoriesModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory CategoriesModel.fromMap(Map<String, dynamic> map) {
    return CategoriesModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesModel.fromJson(String source) =>
      CategoriesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  // Add fromJsonList method to handle list of categories
  static List<CategoriesModel> fromJsonList(List<dynamic> data) {
    return data.map((json) => CategoriesModel.fromMap(json)).toList();
  }

  @override
  String toString() => 'CategoriesModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant CategoriesModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
