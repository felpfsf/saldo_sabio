import 'package:saldo_sabio/app/core/database/sql_connection_factory.dart';

import './category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final SqlConnectionFactory _sqlConnectionFactory;

  CategoryRepositoryImpl({
    required SqlConnectionFactory sqlConnectionFactory,
  }) : _sqlConnectionFactory = sqlConnectionFactory;

  @override
  Future<void> addCategory(String title) async {
    final con = await _sqlConnectionFactory.openConnection();

    print('title: $title');

    await con.rawInsert('INSERT INTO category (title) VALUES (?)', [title]);
  }
}
