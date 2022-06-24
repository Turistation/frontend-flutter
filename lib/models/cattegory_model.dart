class CattegroryModels{
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;

  CattegroryModels({
    required this.id,
    this.name = '',
    this.createdAt = '',
    this.updatedAt = '',
  });

  factory CattegroryModels.fromJson(Map<String, dynamic> json){
    return CattegroryModels(
      id: json['id'],
      name : json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  @override
  String toString() {
    return 'CattegroryModels{id: $id, createdAt : $createdAt, updatedAt: $updatedAt, name: $name}';
  }
}