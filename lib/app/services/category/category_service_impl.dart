import 'package:saldo_sabio/app/models/category_model.dart';
import 'package:saldo_sabio/app/repositories/category/category_repository.dart';

import './category_service.dart';

class CategoryServiceImpl implements CategoryService {
  final CategoryRepository _categoryRepository;

  CategoryServiceImpl({
    required CategoryRepository categoryRepository,
  }) : _categoryRepository = categoryRepository;

  @override
  Future<void> addCategory(String title) =>
      _categoryRepository.addCategory(title);

  @override
  Future<List<CategoryModel>> getCategories() =>
      _categoryRepository.getCategories();
}
