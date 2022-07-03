// ignore_for_file: prefer_if_null_operators

class AdminModel {
  final int id;
  final String name;
  final String email;

  AdminModel({
    this.id = 0,
    this.name = '',
    this.email = '',
  });

  factory AdminModel.fromJson({Map<String, dynamic> json = const {}}) {
    return AdminModel(
      id: json['id'] == null ? 0 : json['id'],
      name: json['name'] == null ? '' : json['name'],
      email : json['email'] == null ? '' : json['email'],
    );
  }

  @override
  String toString() {
    return 'CategoryModel{id: $id, name: $name, email: $email}';
  }
}
