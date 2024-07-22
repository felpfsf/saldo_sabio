import 'package:saldo_sabio/app/core/database/sql_connection_factory.dart';
import 'package:saldo_sabio/app/models/category_model.dart';

import './category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final SqlConnectionFactory _sqlConnectionFactory;

  CategoryRepositoryImpl({
    required SqlConnectionFactory sqlConnectionFactory,
  }) : _sqlConnectionFactory = sqlConnectionFactory;

  @override
  Future<void> addCategory(String title, String userId) async {
    final con = await _sqlConnectionFactory.openConnection();

    // await con.rawInsert('INSERT INTO category (title) VALUES (?)', [title]);
    await con.insert('category', {
      'title': title,
      'user_id': userId,
    });
  }

  @override
  Future<List<CategoryModel>> getCategories(String userId) async {
    final con = await _sqlConnectionFactory.openConnection();

    const sql = '''
      SELECT * FROM category
      WHERE user_id = ?
    ''';

    final result = await con.rawQuery(sql, [userId]);

    return result.map((e) => CategoryModel.fromMap(e)).toList();
  }

  @override
  Future<CategoryModel?> getCategoryById(int id) async {
    final con = await _sqlConnectionFactory.openConnection();

    final result =
        await con.rawQuery('SELECT * FROM category WHERE id = ?', [id]);

    if (result.isEmpty) {
      throw Exception('Categoria não encontrada');
    }

    return CategoryModel.fromMap(result.first);
  }
}
