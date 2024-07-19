import 'dart:developer';

import 'package:saldo_sabio/app/core/database/sql_connection_factory.dart';
import 'package:saldo_sabio/app/core/exceptions/transaction_exception.dart';
import 'package:saldo_sabio/app/models/record_type_enum.dart';
import 'package:saldo_sabio/app/models/transaction_model.dart';

import './transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final SqlConnectionFactory _sqliteConnectionFactory;

  TransactionRepositoryImpl({
    required SqlConnectionFactory sqliteConnectionFactory,
  }) : _sqliteConnectionFactory = sqliteConnectionFactory;

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
    try {
      final con = await _sqliteConnectionFactory.openConnection();

      await con.insert('transactions', {
        'title': transaction.title,
        'description': transaction.description,
        'amount': transaction.amount.toDouble(),
        'record_type': transaction.recordType.toShortString(),
        'date': transaction.date.toIso8601String(),
        'category_id': transaction.categoryId,
        'user_id': transaction.userId,
      });
    } catch (e, s) {
      log('❌ Erro ao salvar transação', error: e, stackTrace: s);
      throw TransactionError(
        message: '❌ Erro ao salvar transação ${e.toString()}',
      );
    }
  }

  @override
  Future<void> deleteTransaction(int id) async {
    final con = await _sqliteConnectionFactory.openConnection();
    await con.rawDelete('DELETE FROM transactions WHERE id = ?', [id]);
  }

  @override
  Future<List<TransactionModel>> getTransactions(String userId) async {
    final con = await _sqliteConnectionFactory.openConnection();

    const sql = '''
      SELECT t.*, 
      c.id as category_id, c.title as category_title
      FROM transactions t
      JOIN category c ON t.category_id = c.id
      WHERE user_id = ?
      ORDER BY date DESC
    ''';

    final result = await con.rawQuery(sql, [userId]);
    print("🚀 ~ TransactionRepositoryImpl ~ $result");


    return result.map((row) => TransactionModel.fromMap(row)).toList();
  }
}
