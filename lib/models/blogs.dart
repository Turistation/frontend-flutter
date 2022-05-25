class Blogs {
  final int id;
  final int blog_categories_id;
  final String title;
  final String description;

  Blogs({
    required this.id,
    required this.blog_categories_id,
    required this.title,
    required this.description,
  });

  factory Blogs.fromJson(Map<String, dynamic> json) {
    return Blogs(
      id: json['_id'] as int,
      blog_categories_id: json['blog_categories_id'] as int,
      title: json['title'] as String,
      description: json['description'] as String
    );
  }

  @override
  String toString() {
    return 'Blogs{id: $id, name: $title, age: $description}';
  }
}
