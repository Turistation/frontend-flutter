class Blogs {
  int id;
  String category;
  String title;
  String description;
  String photo;

  Blogs(this.id, this.category, this.title, this.description, this.photo);

  factory Blogs.fromJson({Map<String, dynamic> json = const {}}) {
    return Blogs(
      json['id'] == null ? 0 : json['id'],
      json['category'] == null ? '' : json['category'],
      json['title'] == null ? '' : json['title'],
      json['description'] == null ? '' : json['description'],
      json['photos'] == null ? '' : json['photos'][0]['photos'],
    );
  }

  @override
  String toString() {
    return 'Blogs{id: $id, name: $title, category: $category, age: $description, photo: $photo}';
  }
}
