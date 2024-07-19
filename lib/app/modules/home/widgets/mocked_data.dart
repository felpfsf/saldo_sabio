import 'package:saldo_sabio/app/models/category_model.dart';
import 'package:saldo_sabio/app/models/record_type_enum.dart';
import 'package:saldo_sabio/app/models/transaction_model.dart';

List<TransactionModel> mockedTransactions = [
  TransactionModel(
    id: 1,
    userId: '1',
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
    userId: '1',
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
    userId: '1',
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

const List<Map<String, dynamic>> mockedCategories = [
  {'id': 1, 'label': 'Venda'},
  {'id': 2, 'label': 'Salário'},
  {'id': 3, 'label': 'Alimentação'},
  {'id': 4, 'label': 'Lazer'},
  {'id': 5, 'label': 'Lazer2'},
  {'id': 6, 'label': 'Lazer3'},
  {'id': 7, 'label': 'Lazer4'},
];