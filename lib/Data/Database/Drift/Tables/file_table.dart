import 'package:drift/drift.dart';
import 'package:my_file_picker_app/Global/file_table_constants.dart';
import 'folder_table.dart';

class FilesTable extends Table {
  TextColumn get id => text()(); // Primary key
  TextColumn get name => text()();
  TextColumn get path => text()();
  TextColumn get size => text()();
  TextColumn get extension => text()();

  // Foreign key to FoldersTable
  TextColumn get parentId => text().references(FoldersTable, #id, onDelete: KeyAction.cascade)();

  TextColumn get createdAt => text()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => FileTableConstants.tableName;
}
