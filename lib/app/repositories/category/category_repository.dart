import 'package:saldo_sabio/app/models/category_model.dart';

abstract interface class CategoryRepository {
  Future<void> addCategory(String title, String userId);
  Future<List<CategoryModel>> getCategories(String userId);
  Future<CategoryModel?> getCategoryById(int id);
}
