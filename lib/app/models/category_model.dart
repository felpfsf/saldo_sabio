class CategoryModel {
  final int id;
  final String title;

  CategoryModel({
    required this.id,
    required this.title,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int,
      title: map['title'] as String,
    );
  }

  CategoryModel copyWith({
    int? id,
    String? title,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}
