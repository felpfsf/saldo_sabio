import 'package:saldo_sabio/app/models/category_model.dart';
import 'package:saldo_sabio/app/models/record_type_enum.dart';

class TransactionModel {
  final int id;
  final String userId;
  final String title;
  final String description;
  final double amount;
  final DateTime date;
  final CategoryModel category;
  final RecordTypeEnum recordType;

  TransactionModel({
    required this.id,
    required this.userId,
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
      userId: map['user_id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      amount: map['amount'] as double,
      date: DateTime.parse(map['date'] as String),
      category: CategoryModel(
        id: map['category_id'] as int,
        title: map['category_title'] as String,
        userId: map['category_user_id'] as String,
      ),
      recordType: RecordTypeEnum.values
          .firstWhere((e) => e.toShortString() == map['record_type']),
    );
  }

  TransactionModel copyWith({
    int? id,
    String? userId,
    String? title,
    String? description,
    double? amount,
    DateTime? date,
    CategoryModel? category,
    RecordTypeEnum? recordType,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      category: category ?? this.category,
      recordType: recordType ?? this.recordType,
    );
  }
}
