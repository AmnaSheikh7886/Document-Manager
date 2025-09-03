import 'package:drift/drift.dart';
import 'package:my_file_picker_app/Data/Database/Drift/Services/drift_database_services.dart';
import 'package:my_file_picker_app/Data/Database/Drift/drift_database.dart';
import 'package:my_file_picker_app/Data/Model/file_model.dart';
import 'package:my_file_picker_app/Data/Model/folder_model.dart';

class DriftDatabaseServicesImpl implements DriftDatabaseServices {
  final database;

  DriftDatabaseServicesImpl({required this.database});

  @override
  Future<void> createFolder(Folder folder) async {
    await database
        .into(database.foldersTable)
        .insert(
          FoldersTableCompanion.insert(
            id: folder.id,
            name: folder.name,
            createdAt: folder.createdAt,
            filesCount: Value(folder.filesCount),
            color: folder.color,
          ),
        );
  }

  @override
  Future<List<Folder>> getAllFolders() async {
    final rows = await database.select(database.foldersTable).get();
    return rows
        .map<Folder>(
          (row) => Folder(
            id: row.id,
            name: row.name,
            createdAt: row.createdAt,
            filesCount: row.filesCount,
            color: row.color,
          ),
        )
        .toList();
  }

  @override
  Future<void> insertMultipleFiles(List<FileModel> files) async {
    await database.batch((batch) {
      batch.insertAll(
        database.filesTable,
        files
            .map(
              (file) => FilesTableCompanion.insert(
                id: file.id,
                name: file.name,
                path: file.path,
                size: file.size,
                extension: file.extension,
                parentId: file.parentId,
                createdAt: file.createdAt,
              ),
            )
            .toList(),
      );
    });
  }

  @override
  Future<List<FileModel>> getFilesByParentId({required String parentId}) async {
    final query = await (database.select(database.filesTable)
      ..where(
        (HasResultSet tbl) =>
            database.filesTable.parentId.equals(parentId) as Expression<bool>,
      ));

    final rows = await query.get();

    return rows
        .map<FileModel>(
          (row) => FileModel(
            id: row.id,
            name: row.name,
            path: row.path,
            size: row.size,
            extension: row.extension,
            parentId: row.parentId,
            createdAt: row.createdAt,
          ),
        )
        .toList();
  }

  @override
  Future<void> incrementFilesCount({
    required int value,
    required String folderId,
  }) async {
    // Getting Current Count
    final currentRecord =
        await (database.select(database.foldersTable)..where(
              (HasResultSet tbl) =>
                  database.foldersTable.id.equals(folderId) as Expression<bool>,
            ))
            .getSingle();
    final currentCount = currentRecord.filesCount;
    // Updating filesCount
    await (database.update(database.foldersTable)..where(
          (HasResultSet tbl) =>
              database.foldersTable.id.equals(folderId) as Expression<bool>,
        ))
        .write(FoldersTableCompanion(filesCount: Value(currentCount + value)));
  }
}
