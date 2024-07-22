import 'package:saldo_sabio/app/models/category_model.dart';

abstract interface class CategoryService {
  Future<void> addCategory(String title, String userId);
  Future<List<CategoryModel>> getCategories();

}
