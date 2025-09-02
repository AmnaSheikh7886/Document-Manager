import 'package:drift/drift.dart';
import 'package:my_file_picker_app/Global/folder_table_constants.dart';

class FoldersTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get createdAt => text()();
  IntColumn get filesCount => integer().withDefault(const Constant(0))();
  IntColumn get color => integer()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => FolderTableConstants.tableName;
}
