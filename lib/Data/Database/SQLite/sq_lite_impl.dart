import 'package:my_file_picker_app/Data/Database/SQLite/db_helper.dart';
import 'package:my_file_picker_app/Data/Database/database_services.dart';
import 'package:sqflite/sqflite.dart';

class SqLiteImpl implements DatabaseServices
{
  DatabaseHelper databaseHelper=DatabaseHelper.getInstance;
  Future<Database> get _db async=> await databaseHelper.getDb();

  @override
  Future<int> insertData(String table,Map<String, dynamic> values) async{
    final db= await _db;
    return await db.insert(table, values);
  }

  @override
  Future<List<Map<String, dynamic>>> getAllData(String table) async{
    final db= await _db;
    return await db.query(table);
  }

  @override
  Future<void> insertMultipleRows(
      String table,
      List<Map<String, dynamic>> values,
      ) async {
    final db = await _db;

    await db.transaction((txn) async {
      final batch = txn.batch();

      for (final row in values) {
        batch.insert(table, row);
      }
      await batch.commit(noResult: true);
    });
  }

  @override
  Future<List<Map<String, dynamic>>> getDataByColumnValue({
    required String tableName,
    required String columnName,
    required dynamic columnValue,
  }) async {
    final db = await _db;

    return await db.query(
      tableName,
      where: '$columnName = ?',
      whereArgs: [columnValue],
    );
  }

  @override
  Future<void> incrementColumnValue({
    required String tableName,
    required String columnName,
    required dynamic incrementValue,
    required String whereColumn,
    required dynamic whereValue,
  }) async {
    final db = await _db;

    await db.rawUpdate(
      '''
    UPDATE $tableName
    SET $columnName = $columnName + ?
    WHERE $whereColumn = ?
    ''',
      [incrementValue, whereValue],
    );
  }

}