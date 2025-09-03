import 'package:my_file_picker_app/Data/Model/folder_model.dart';

abstract class FolderManager
{
  Future<void> createFolder(String name,int color);
  Future<List<Folder>> getFolders();
  Stream<List<Folder>> watchFolders();
}