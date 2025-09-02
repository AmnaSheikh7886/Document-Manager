abstract class DatabaseServices {
  Future<int> insertData(String table, Map<String, dynamic> values);
  Future<List<Map<String, dynamic>>> getAllData(String table);
  Future insertMultipleRows(String table, List<Map<String, dynamic>> values);
  Future<List<Map<String, dynamic>>> getDataByColumnValue({
    required String tableName,
    required String columnName,
    required dynamic columnValue,
  });
  Future<void> incrementColumnValue({
    required String tableName,
    required String columnName,
    required dynamic incrementValue,
    required String whereColumn,
    required dynamic whereValue,
  });
}
