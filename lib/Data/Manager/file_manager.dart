import 'package:my_file_picker_app/Data/Model/file_model.dart';

abstract class FileManager
{
  void temporarySaveFile({required String fileName, required String path, required String extension, required String size, required String parentId});
  List<FileModel> uploadFiles();
  void deleteFile(int index);
  void editFileName(int index,String name);
  Future permanentlySavefiles(String parentId);
  Future<List<FileModel>> getPermanentFiles(String parentId);
}