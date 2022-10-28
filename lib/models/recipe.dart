class Recipe {
  final int id;
  final String title;
  final String image;
  final String description;

  const Recipe({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      description: json['description'],
    );
  }
}
