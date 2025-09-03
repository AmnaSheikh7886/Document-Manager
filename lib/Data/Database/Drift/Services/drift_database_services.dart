import 'package:my_file_picker_app/Data/Model/file_model.dart';
import 'package:my_file_picker_app/Data/Model/folder_model.dart';

abstract class DriftDatabaseServices
{
  Future<void> createFolder(Folder folder);
  Future<List<Folder>> getAllFolders();
  Stream<List<Folder>>watchAllFolders();
  Future<void> insertMultipleFiles(List<FileModel> files);
  Future<List<FileModel>> getFilesByParentId({required String parentId});
  Stream<List<FileModel>>watchFilesByParentId({required String parentId});
  Future<void> incrementFilesCount({required int value, required String folderId});
}