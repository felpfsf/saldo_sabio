import 'package:saldo_sabio/app/models/record_type_enum.dart';
import 'package:saldo_sabio/app/models/transaction_model.dart';

abstract interface class TransactionService {
  Future<void> saveTransaction(
      ({
        String title,
        String description,
        num amount,
        RecordTypeEnum recordType,
        DateTime date,
        int categoryId,
        String userId,
      }) transaction);
  Future<List<TransactionModel>> getTransactions();
}
