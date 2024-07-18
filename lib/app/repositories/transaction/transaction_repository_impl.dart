import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:saldo_sabio/app/core/database/sql_connection_factory.dart';
import 'package:saldo_sabio/app/core/exceptions/transaction_exception.dart';
import 'package:saldo_sabio/app/models/record_type_enum.dart';

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
      }) transaction) async {
    try {
      final con = await _sqliteConnectionFactory.openConnection();

      debugPrint(transaction.toString());

      await con.insert('transaction', {
        'title': transaction.title,
        'description': transaction.description,
        'amount': transaction.amount,
        'record_type': transaction.recordType.toString(),
        'date': transaction.date.toIso8601String(),
        'category_id': transaction.categoryId,
      });
    } catch (e, s) {
      log('❌ Erro ao salvar transação', error: e, stackTrace: s);
      throw TransactionError(
        message: '❌ Erro ao salvar transação ${e.toString()}',
      );
    }
  }
}
