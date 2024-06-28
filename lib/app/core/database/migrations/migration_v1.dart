import 'package:saldo_sabio/app/core/database/migrations/migrations.dart';
import 'package:sqflite/sqlite_api.dart';

class MigrationV1 extends Migrations {
  @override
  void create(Batch batch) {
    // Category table
    batch.execute('''
      CREATE TABLE IF NOT EXISTS category (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title VARCHAR(255) NOT NULL
      )
    ''');

    // Transaction table
    batch.execute('''
      CREATE TABLE IF NOT EXISTS transaction (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        category_id INTEGER NOT NULL,
        title VARCHAR(255) NOT NULL,
        description TEXT NOT NULL,
        amount REAL NOT NULL,
        date DATETIME NOT NULL,
        FOREIGN KEY (category_id) REFERENCES category(id)
      )
    ''');
  }

  @override
  void update(Batch batch) {
  }
}
