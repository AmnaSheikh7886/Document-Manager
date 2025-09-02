import 'package:intl/intl.dart';
import 'package:my_file_picker_app/Data/Manager/file_manager.dart';
import 'package:my_file_picker_app/Data/Model/file_model.dart';
import 'package:my_file_picker_app/Data/Model/file_model_mapper.dart';
import 'package:my_file_picker_app/Global/file_table_constants.dart';
import 'package:my_file_picker_app/Global/folder_table_constants.dart';
import 'package:uuid/uuid.dart';

import '../Database/SQLite/database_services.dart';

class FileManagerImpl extends FileManager {
  List<FileModel> filesList = [];
  final Uuid uuid = Uuid();
  String get _id => uuid.v4();
  String get _time => DateFormat('dd MMMM yyyy').format(DateTime.now());
  DatabaseServices databaseServices;

  FileManagerImpl({required this.databaseServices});

  @override
  List<FileModel> uploadFiles() {
    return filesList;
  }

  @override
  void temporarySaveFile({
    required String fileName,
    required String path,
    required String extension,
    required String size,
    required String parentId,
  }) {
    final String id = _id;
    final String createdAt = _time;
    FileModel file = FileModel(
      id: id,
      name: fileName,
      path: path,
      size: size,
      extension: extension,
      parentId: parentId,
      createdAt: createdAt,
    );
    filesList.add(file);
  }

  @override
  void deleteFile(int index) {
    filesList.removeAt(index);
  }

  @override
  void editFileName(int index, String name) {
    filesList[index].name = name;
  }

  @override
  Future permanentlySavefiles(String parentId) async {
    List<Map<String, dynamic>> filesJson = filesList
        .map((file) => FileModelMapper.toJson(file))
        .toList();
    //Saving in Database
    await databaseServices.insertMultipleRows(
      FileTableConstants.tableName,
      filesJson,
    );
    //Incrementing value
    await databaseServices.incrementColumnValue(
      tableName: FolderTableConstants.tableName,
      columnName: FolderTableConstants.filesCount,
      incrementValue: filesList.length,
      whereColumn: FolderTableConstants.id,
      whereValue: parentId,
    );
    filesList.clear();
  }

  @override
  Future<List<FileModel>> getPermanentFiles(String parentId) async {
    List<Map<String, dynamic>> filesJson = await databaseServices
        .getDataByColumnValue(
          tableName: FileTableConstants.tableName,
          columnName: FileTableConstants.parentId,
          columnValue: parentId,
        );
    return filesJson.map((json) => FileModelMapper.fromJson(json)).toList();
  }
}
