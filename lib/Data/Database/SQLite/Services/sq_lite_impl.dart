import 'package:my_file_picker_app/Data/Database/SQLite/db_helper.dart';
import 'package:my_file_picker_app/Data/Database/database_services.dart';
import 'package:my_file_picker_app/Data/Model/file_model.dart';
import 'package:my_file_picker_app/Data/Model/file_model_mapper.dart';
import 'package:my_file_picker_app/Data/Model/folder_model.dart';
import 'package:my_file_picker_app/Data/Model/folder_model_mapper.dart';
import 'package:my_file_picker_app/Global/file_table_constants.dart';
import 'package:my_file_picker_app/Global/folder_table_constants.dart';
import 'package:sqflite/sqflite.dart';

class SqLiteImpl implements DatabaseServices
{
  DatabaseHelper databaseHelper;
  Future<Database> get _database async=>await databaseHelper.getDb();

  SqLiteImpl({required this.databaseHelper});


  @override
  Future<void> createFolder(folder) async{
    Map<String, dynamic> folderJson = FolderModelMapper.toJson(folder);
    Database database=await _database;
    await database.insert(FolderTableConstants.tableName, folderJson);

  }

  @override
  Future<List<Folder>> getAllFolders()async {
    Database database=await _database;
    final foldersJson= await database.query(FolderTableConstants.tableName);
    return foldersJson.map((folder)=>FolderModelMapper.fromJson(folder)).toList();
  }

  @override
  Future<List<FileModel>> getFilesByParentId({required String parentId}) async{
    Database database=await _database;
    final filesJson= await database.query(
          FileTableConstants.tableName,
          where: '${FileTableConstants.parentId} = ?',
          whereArgs: [parentId],
        );
    return filesJson.map((file)=>FileModelMapper.fromJson(file)).toList();
  }

  @override
  Future<void> incrementFilesCount({required int value, required String folderId}) async{
    Database database=await _database;
    await database.rawUpdate(
          '''
        UPDATE ${FolderTableConstants.tableName}
        SET ${FolderTableConstants.filesCount} = ${FolderTableConstants.filesCount} + ?
        WHERE ${FolderTableConstants.id} = ?
        ''',
          [value, folderId],
        );
  }

  @override
  Future<void> insertMultipleFiles(List<FileModel> files) async{
    Database database=await _database;
    List<Map<String, dynamic>> filesJson = files
        .map((file) => FileModelMapper.toJson(file))
        .toList();
    await database.transaction((txn) async {
          final batch = txn.batch();

          for (final row in filesJson) {
            batch.insert(FileTableConstants.tableName, row);
          }
          await batch.commit(noResult: true);
        });
  }

  @override
  Stream<List<Folder>> watchAllFolders() {
    throw UnimplementedError("It is not Implemented");
  }

  @override
  Stream<List<FileModel>> watchFilesByParentId({required String parentId}) {
    throw UnimplementedError("It is not Implemented");

  }


  // DatabaseHelper databaseHelper=DatabaseHelper.getInstance;
  // Future<Database> get _db async=> await databaseHelper.getDb();
  //
  // @override
  // Future<int> insertData(String table,Map<String, dynamic> values) async{
  //   final db= await _db;
  //   return await db.insert(table, values);
  // }
  //
  // @override
  // Future<List<Map<String, dynamic>>> getAllData(String table) async{
  //   final db= await _db;
  //   return await db.query(table);
  // }
  //
  // @override
  // Future<void> insertMultipleRows(
  //     String table,
  //     List<Map<String, dynamic>> values,
  //     ) async {
  //   final db = await _db;
  //
  //   await db.transaction((txn) async {
  //     final batch = txn.batch();
  //
  //     for (final row in values) {
  //       batch.insert(table, row);
  //     }
  //     await batch.commit(noResult: true);
  //   });
  // }
  //
  // @override
  // Future<List<Map<String, dynamic>>> getDataByColumnValue({
  //   required String tableName,
  //   required String columnName,
  //   required dynamic columnValue,
  // }) async {
  //   final db = await _db;
  //
  //   return await db.query(
  //     tableName,
  //     where: '$columnName = ?',
  //     whereArgs: [columnValue],
  //   );
  // }
  //
  // @override
  // Future<void> incrementColumnValue({
  //   required String tableName,
  //   required String columnName,
  //   required dynamic incrementValue,
  //   required String whereColumn,
  //   required dynamic whereValue,
  // }) async {
  //   final db = await _db;
  //
  //   await db.rawUpdate(
  //     '''
  //   UPDATE $tableName
  //   SET $columnName = $columnName + ?
  //   WHERE $whereColumn = ?
  //   ''',
  //     [incrementValue, whereValue],
  //   );
  // }



}