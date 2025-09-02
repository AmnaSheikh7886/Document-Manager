import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'Tables/file_table.dart';
import 'Tables/folder_table.dart';
part 'drift_database.g.dart';

@DriftDatabase(tables: [FoldersTable, FilesTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  // Database version
  @override
  int get schemaVersion => 1;

  // Migration strategy
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {

      for (final table in allTables) {
        await m.deleteTable(table.actualTableName);
      }
      await m.createAll();
    },
    beforeOpen: (details) async {
      // Enable foreign keys
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}

// Lazy database initializer
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'folders_files.sqlite'));
    return NativeDatabase(file);
  });
}
