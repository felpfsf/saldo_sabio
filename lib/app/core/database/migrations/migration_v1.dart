import 'package:saldo_sabio/app/core/database/migrations/migrations.dart';
import 'package:sqflite/sqlite_api.dart';

class MigrationV1 extends Migrations {
  @override
  void create(Batch batch) {
    // Category table
    batch.execute('''
      CREATE TABLE IF NOT EXISTS category (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id TEXT NOT NULL,
        title VARCHAR(255) NOT NULL
      )
    ''');

    // Transaction table
    batch.execute('''
      CREATE TABLE IF NOT EXISTS transactions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        category_id INTEGER NOT NULL,
        user_id TEXT NOT NULL,
        title VARCHAR(255) NOT NULL,
        description VARCHAR(255),
        amount REAL NOT NULL,
        date DATETIME NOT NULL,
        record_type TEXT NOT NULL,
        FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE CASCADE ON UPDATE NO ACTION
      )
    ''');
  }

  @override
  void update(Batch batch) {}
}
