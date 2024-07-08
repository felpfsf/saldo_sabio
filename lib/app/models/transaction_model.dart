import 'package:saldo_sabio/app/models/category_model.dart';
import 'package:saldo_sabio/app/models/record_type_enum.dart';

class TransactionModel {
  final int id;
  final String title;
  final String description;
  final double amount;
  final DateTime date;
  final CategoryModel category;
  final RecordTypeEnum recordType;

  TransactionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
    required this.category,
    required this.recordType,
  });
}