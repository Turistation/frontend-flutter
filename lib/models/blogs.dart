class Blogs {
  final int id;
  final String category;
  final String title;
  final String description;
  final String photo;

  Blogs({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.photo,
  });

  factory Blogs.fromJson(Map<String, dynamic> json) {
    return Blogs(
      id: json['id'] as int,
      category: json['blog_category']['name'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      photo: json['photos'][0]['photos'] as String,
    );
  }

  @override
  String toString() {
    return 'Blogs{id: $id, name: $title, category: $category, age: $description, photo: $photo}';
  }
}
