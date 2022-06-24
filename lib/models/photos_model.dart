// ignore_for_file: non_constant_identifier_names

import 'package:touristation/models/cattegory_model.dart';

class PhotosModel{
  final int id;
  // final CattegroryModels category;
  final String createdAt;
  final String updatedAt;
  final String photos;

  PhotosModel({
    // this.category = null,
    required this.id,
    required this.photos,
    // this.name = '',
    this.createdAt = '',
    this.updatedAt = '',
  });

  factory PhotosModel.fromJson(Map<String, dynamic> json){
    return PhotosModel(
      id: json['id'],
      // name : json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      photos: json['photos']
    );
  }

  @override
  String toString() {
    return 'PhotosModel{id: $id, photos: $photos, createdAt : $createdAt, updatedAt: $updatedAt}';
  }
}