import 'package:saldo_sabio/app/models/record_type_enum.dart';

abstract interface class TransactionRepository {
  Future<void> saveTransaction(
      ({
        String title,
        String description,
        num amount,
        RecordTypeEnum recordType,
        DateTime date,
        int categoryId,
      }) transaction);
}
