import 'package:saldo_sabio/app/repositories/category/category_repository.dart';
import 'package:saldo_sabio/app/repositories/category/category_repository_impl.dart';

import './category_service.dart';

class CategoryServiceImpl implements CategoryService {
  final CategoryRepository _categoryRepository;

  CategoryServiceImpl({
    required CategoryRepositoryImpl categoryRepository,
  }) : _categoryRepository = categoryRepository;

  @override
  Future<void> addCategory(String title) =>
      _categoryRepository.addCategory(title);
}
