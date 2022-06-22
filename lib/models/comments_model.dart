import 'dart:convert';

class CommentsModel {
  final String comment;
  final int star;
  final String name;
  final int id;
  final String createdAt;
  final int blogId;

  CommentsModel({
    this.comment = '',
    this.star = 0,
    this.name = '',
    this.createdAt = '',
    required this.blogId,
    required this.id,
  });

  factory CommentsModel.fromJson(Map<String, dynamic> json) {
    return CommentsModel(
      id: json['id'],
      comment: json['comment'] as String,
      name: json['name'] as String,
      star: json['star'] as int,
      createdAt: json['created_at'] as String,
      blogId: json['blogs_id'] as int,
    );
  }

  @override
  String toString() {
    return 'CommentsModel{id: $id, name: $name, star: $star, comment: $comment, createdAt: $createdAt}';
  }

  // Convert to JSON
  Map<String, dynamic> toJson() => {
        'comment': comment,
        'name': name,
        'star': star,
        'created_at': createdAt,
        'blogs_id': blogId,
      };
}
