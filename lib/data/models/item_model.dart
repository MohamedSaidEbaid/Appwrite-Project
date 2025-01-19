class ItemModel {
  final String id;
  final String title;
  final String description;

  ItemModel({required this.id, required this.title, required this.description});

  // Factory to create an instance from JSON
  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['\$id'],
      title: json['title'],
      description: json['description'],
    );
  }

  // convert the instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
    };
  }
}
