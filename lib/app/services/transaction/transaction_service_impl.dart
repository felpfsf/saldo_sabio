import 'package:saldo_sabio/app/core/exceptions/transaction_exception.dart';
import 'package:saldo_sabio/app/models/record_type_enum.dart';
import 'package:saldo_sabio/app/models/transaction_model.dart';
import 'package:saldo_sabio/app/repositories/category/category_repository.dart';
import 'package:saldo_sabio/app/repositories/transaction/transaction_repository.dart';
import 'package:saldo_sabio/app/repositories/user/user_repository.dart';

import './transaction_service.dart';

class TransactionServiceImpl implements TransactionService {
  final TransactionRepository _transactionRepository;
  final CategoryRepository _categoryRepository;
  final UserRepository _userRepository;

  TransactionServiceImpl({
    required TransactionRepository transactionRepository,
    required CategoryRepository categoryRepository,
    required UserRepository userRepository,
  })  : _transactionRepository = transactionRepository,
        _categoryRepository = categoryRepository,
        _userRepository = userRepository;

  @override
  Future<void> saveTransaction(
      ({
        String title,
        String description,
        num amount,
        RecordTypeEnum recordType,
        DateTime date,
        int categoryId,
        String userId,
      }) transaction) async {
    final category =
        await _categoryRepository.getCategoryById(transaction.categoryId);

    if (category == null) {
      throw TransactionError(message: 'Categoria não encontrada');
    }

    _transactionRepository.saveTransaction(transaction);
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    final user = await _userRepository.getUser();

    if (user == null) {
      throw TransactionError(message: 'Usuário não encontrado');
    }

    return _transactionRepository.getTransactions(user.uid);
  }

  @override
  Future<List<TransactionModel>> searchTransactions(String searchTerm) async {
    final user = await _userRepository.getUser();

    if (user == null) {
      throw TransactionError(message: 'Usuário não encontrado');
    }
    return _transactionRepository.searchTransactions(user.uid, searchTerm);
  }
}
