import 'package:sqflite/sqlite_api.dart';

abstract class Migrations {
  void create(Batch batch);
  void update(Batch batch);
}