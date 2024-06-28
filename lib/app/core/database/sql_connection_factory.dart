import 'package:path/path.dart';
import 'package:saldo_sabio/app/core/database/sql_migration_factory.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

class SqlConnectionFactory {
  static const _version = 1;
  static const _databaseName = 'saldo_sabio';

  static SqlConnectionFactory? _instance;

  Database? _database;
  final _lock = Lock();

  SqlConnectionFactory._();

  factory SqlConnectionFactory() {
    _instance ??= SqlConnectionFactory._();

    return _instance!;
  }

  Future<Database> openConnection() async {
    var path = await getDatabasesPath();
    var dbPath = join(path, _databaseName);

    if (_database == null) {
      await _lock.synchronized(() async {
        _database ??= await openDatabase(
          dbPath,
          version: _version,
          onCreate: _onCreate,
          onUpgrade: _onUpgrade,
          onConfigure: _onConfigure,
        );
      });
    }

    return _database!;
  }

  void closeConnection() {
    _database?.close();
    _database = null;
  }

  Future<void> _onConfigure(Database db) async {
    const sql = 'PRAGMA foreign_keys = ON';
    await db.execute(sql);
  }

  Future<void> _onCreate(Database db, int version) async {
    final batch = db.batch();

    final migrations = SqlMigrationFactory().getCreateMigrations();

    for (var migration in migrations) {
      migration.create(batch);
    }

    batch.commit();
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    final batch = db.batch();
    final migrations = SqlMigrationFactory().getUpdateMigrations(oldVersion);

    for (var migration in migrations) {
      migration.update(batch);
    }

    batch.commit();
  }
}
