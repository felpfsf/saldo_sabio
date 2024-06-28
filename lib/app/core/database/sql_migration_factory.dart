import 'package:saldo_sabio/app/core/database/migrations/migration_v1.dart';
import 'package:saldo_sabio/app/core/database/migrations/migrations.dart';

class SqlMigrationFactory {
  List<Migrations> getCreateMigrations() => [
        MigrationV1(),
      ];

  List<Migrations> getUpdateMigrations(int version) {
    final migrations = <Migrations>[];

    if (version == 1) {
      migrations.add(MigrationV1());
    }

    return migrations;
  }
}
