import 'package:equatable/equatable.dart';

class SummerBlogModel extends Equatable{

  final String id;
  final String name;
  final String city;
  final String imageUrl;
  final String details;

  SummerBlogModel({
    required this.id,
    required this.name,
    required this.city,
    required this.imageUrl,
    required this.details,
  });

  factory SummerBlogModel.fromJson(String id, Map<String, dynamic> json) {
    return SummerBlogModel(
      id: id,
      name: json['name'],
      city: json['city'],
      imageUrl: json['imageUrl'],
      details: json['details'],
    );
  }

  @override
  List<Object?> get props => [id, name, city, imageUrl, details];
  
}