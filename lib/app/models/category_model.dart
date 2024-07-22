class CategoryModel {
  final int id;
  final String userId;
  final String title;

  CategoryModel({
    required this.id,
    required this.title,
    required this.userId,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int,
      title: map['title'] as String,
      userId: map['user_id'] as String,
    );
  }

  CategoryModel copyWith({
    int? id,
    String? userId,
    String? title,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
    );
  }
}
