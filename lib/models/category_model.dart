class CategroryModels {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;

  CategroryModels({
    this.id = 0,
    this.name = '',
    this.createdAt = '',
    this.updatedAt = '',
  });

  factory CategroryModels.fromJson(Map<String, dynamic> json) {
    return CategroryModels(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  @override
  String toString() {
    return 'CategroryModels{id: $id, createdAt : $createdAt, updatedAt: $updatedAt, name: $name}';
  }
}
