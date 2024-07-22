import 'package:saldo_sabio/app/core/exceptions/transaction_exception.dart';
import 'package:saldo_sabio/app/models/category_model.dart';
import 'package:saldo_sabio/app/repositories/category/category_repository.dart';
import 'package:saldo_sabio/app/repositories/user/user_repository.dart';

import './category_service.dart';

class CategoryServiceImpl implements CategoryService {
  final CategoryRepository _categoryRepository;
  final UserRepository _userRepository;

  CategoryServiceImpl({
    required CategoryRepository categoryRepository,
    required UserRepository userRepository,
  })  : _categoryRepository = categoryRepository,
        _userRepository = userRepository;

  @override
  Future<void> addCategory(String title, String userId) =>
      _categoryRepository.addCategory(title, userId);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final user = await _userRepository.getUser();

    if (user == null) {
      // TODO: changes transaction exception to category exception
      throw TransactionError(message: 'Usuário não encontrado');
    }

    return _categoryRepository.getCategories(user.uid);
  }
}
