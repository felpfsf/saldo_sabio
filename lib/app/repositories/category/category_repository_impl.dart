import 'package:saldo_sabio/app/core/database/sql_connection_factory.dart';
import 'package:saldo_sabio/app/models/category_model.dart';

import './category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final SqlConnectionFactory _sqlConnectionFactory;

  CategoryRepositoryImpl({
    required SqlConnectionFactory sqlConnectionFactory,
  }) : _sqlConnectionFactory = sqlConnectionFactory;

  @override
  Future<void> addCategory(String title) async {
    final con = await _sqlConnectionFactory.openConnection();

    await con.rawInsert('INSERT INTO category (title) VALUES (?)', [title]);
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final con = await _sqlConnectionFactory.openConnection();

    final result = await con.rawQuery('SELECT * FROM category');

    return result.map((e) => CategoryModel.fromMap(e)).toList();
  }
}
