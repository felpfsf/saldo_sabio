import 'package:saldo_sabio/app/models/category_model.dart';

abstract interface class CategoryRepository {
  Future<void> addCategory(String title);
  Future<List<CategoryModel>> getCategories();
  Future<CategoryModel?> getCategoryById(int id);
}
