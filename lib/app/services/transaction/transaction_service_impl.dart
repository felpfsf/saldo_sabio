import 'package:saldo_sabio/app/core/exceptions/transaction_exception.dart';
import 'package:saldo_sabio/app/models/record_type_enum.dart';
import 'package:saldo_sabio/app/repositories/category/category_repository.dart';
import 'package:saldo_sabio/app/repositories/transaction/transaction_repository.dart';

import './transaction_service.dart';

class TransactionServiceImpl implements TransactionService {
  final TransactionRepository _transactionRepository;
  final CategoryRepository _categoryRepository;

  TransactionServiceImpl({
    required TransactionRepository transactionRepository,
    required CategoryRepository categoryRepository,
  })  : _transactionRepository = transactionRepository,
        _categoryRepository = categoryRepository;

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
}
