import 'package:my_file_picker_app/Data/Model/file_model.dart';
import 'package:my_file_picker_app/Data/Model/folder_model.dart';

abstract class DatabaseServices {
  // Future<int> insertData(String table, Map<String, dynamic> values);
  // Future<List<Map<String, dynamic>>> getAllData(String table);
  // Future insertMultipleRows(String table, List<Map<String, dynamic>> values);
  // Future<List<Map<String, dynamic>>> getDataByColumnValue({
  //   required String tableName,
  //   required String columnName,
  //   required dynamic columnValue,
  // });
  // Future<void> incrementColumnValue({
  //   required String tableName,
  //   required String columnName,
  //   required dynamic incrementValue,
  //   required String whereColumn,
  //   required dynamic whereValue,
  // });
  Future<void> createFolder(Folder folder);
  Future<List<Folder>> getAllFolders();
  Stream<List<Folder>>watchAllFolders();
  Future<void> insertMultipleFiles(List<FileModel> files);
  Future<List<FileModel>> getFilesByParentId({required String parentId});
  Stream<List<FileModel>>watchFilesByParentId({required String parentId});
  Future<void> incrementFilesCount({required int value, required String folderId});
}
