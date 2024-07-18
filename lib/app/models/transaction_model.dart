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

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      amount: map['amount'] as double,
      date: DateTime.parse(map['date'] as String),
      category: CategoryModel.fromMap(map['category'] as Map<String, dynamic>),
      recordType: RecordTypeEnum.values[map['recordType'] as int],
    );
  }

  TransactionModel copyWith({
    int? id,
    String? title,
    String? description,
    double? amount,
    DateTime? date,
    CategoryModel? category,
    RecordTypeEnum? recordType,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      category: category ?? this.category,
      recordType: recordType ?? this.recordType,
    );
  }
}
