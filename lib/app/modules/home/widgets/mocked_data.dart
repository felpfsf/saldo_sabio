import 'package:saldo_sabio/app/models/category_model.dart';
import 'package:saldo_sabio/app/models/record_type_enum.dart';
import 'package:saldo_sabio/app/models/transaction_model.dart';

List<TransactionModel> mockedTransactions = [
  TransactionModel(
    id: 1,
    title: 'Desenvolvimento de aplicação',
    description: 'Desenvolvimento de aplicação',
    amount: 4600,
    date: DateTime.now(),
    category: CategoryModel(
      id: 1,
      title: 'Venda',
    ),
    recordType: RecordTypeEnum.income,
  ),
  TransactionModel(
    id: 2,
    title: 'Almoço',
    description: 'Almoço',
    amount: 65,
    date: DateTime.now(),
    category: CategoryModel(
      id: 1,
      title: 'Alimentação',
    ),
    recordType: RecordTypeEnum.expense,
  ),
  TransactionModel(
    id: 3,
    title: 'Salário',
    description: 'Salário',
    amount: 14000,
    date: DateTime.now(),
    category: CategoryModel(
      id: 1,
      title: 'Salário',
    ),
    recordType: RecordTypeEnum.income,
  ),
];
