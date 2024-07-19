import 'package:saldo_sabio/app/models/record_type_enum.dart';

class SummaryTransactionModel {
  final double totalAmount;
  final DateTime? lastEntryDate;
  final RecordTypeEnum? recordType;

  SummaryTransactionModel({
    required this.totalAmount,
    this.lastEntryDate,
    this.recordType,
  });
}
