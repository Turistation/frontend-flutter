class CategoryModel {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;

  CategoryModel({
    this.id = 0,
    this.name = '',
    this.createdAt = '',
    this.updatedAt = '',
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  @override
  String toString() {
    return 'CategoryModel{id: $id, createdAt : $createdAt, updatedAt: $updatedAt, name: $name}';
  }
}
