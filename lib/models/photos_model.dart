import 'package:collection/collection.dart';
import 'package:touristation/models/blogs.dart';
import 'package:touristation/models/category_model.dart';

class PhotosModel {
  int id;
  CategroryModels category;
  Blogs blog;
  String createdAt;
  String updatedAt;
  String photos;

  PhotosModel(this.id, this.category, this.blog, this.createdAt, this.updatedAt,
      this.photos);

  factory PhotosModel.fromJson(Map<String, dynamic> json) {
    return PhotosModel(
      json['id'],
      CategroryModels.fromJson(json['blog_category']),
      (json["blogs"] as List).isEmpty
          ? Blogs.fromJson()
          : Blogs.fromJson(json: json["blogs"][0]),
      json['created_at'],
      json['updated_at'],
      json['photos'],
    );
  }

  @override
  String toString() {
    return 'PhotosModel{id: $id, photos: $photos, createdAt : $createdAt, updatedAt: $updatedAt}';
  }
}
