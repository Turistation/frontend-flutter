// ignore_for_file: prefer_if_null_operators

import 'package:touristation/models/admins_model.dart';
import 'package:touristation/models/comments_model.dart';

class Blogs {
  int id;
  String category;
  String title;
  String description;
  String photo;
  AdminModel admin;
  List<CommentsModel> comments;
  final String createdAt;

  Blogs(this.id, this.category, this.title, this.description, this.photo,
      this.admin, this.createdAt, this.comments);

  factory Blogs.fromJson({Map<String, dynamic> json = const {}}) {
    return Blogs(
        json['id'] == null ? 0 : json['id'],
        json['category'] == null ? '' : json['category'],
        json['title'] == null ? '' : json['title'],
        json['description'] == null ? '' : json['description'],
        json['photos'] == null ? '' : json['photos'][0]['photos'],
        json['admin_blog'] == null
            ? AdminModel.fromJson()
            : AdminModel.fromJson(json: json['admin_blog']),
        // AdminModel.fromJson(json['admin_blog']) ,
        json['created_at'] == null ? '' : json['created_at'],
        json['blog_comments'] == null
            ? []
            : List<CommentsModel>.from(
                json['blog_comments'].map((x) => CommentsModel.fromJson(x))));
  }

  @override
  String toString() {
    return 'Blogs{id: $id, created_at:$createdAt ,name: $title, category: $category, age: $description, photo: $photo, admin:$admin}';
  }

  num getAvgStar() {
    if (comments.isEmpty) return 0;
    int sum = 0;
    for (var comment in comments) {
      sum += comment.star;
    }
    return (sum ~/ comments.length) / 20;
  }
}
