import 'package:intl/intl.dart';
import 'package:my_file_picker_app/Data/Database/SQLite/database_services.dart';
import 'package:my_file_picker_app/Data/Manager/folder_manager.dart';
import 'package:my_file_picker_app/Data/Model/folder_model.dart';
import 'package:my_file_picker_app/Data/Model/folder_model_mapper.dart';
import 'package:my_file_picker_app/Global/folder_table_constants.dart';
import 'package:uuid/uuid.dart';

class FolderManagerImpl implements FolderManager
{
  final Uuid uuid=Uuid();
  String get _id=>uuid.v4();
  String get _time=>DateFormat('dd MMMM yyyy').format(DateTime.now());

  DatabaseServices databaseServices;

  FolderManagerImpl({required this.databaseServices});

  @override
  Future<int> createFolder(String name,int color) async{
    final String id=_id;
    final String createdAt=_time;
    Folder folder= Folder(id: id, name: name, createdAt: createdAt,color: color);
    Map<String,dynamic> folderJson=FolderModelMapper.toJson(folder);
    return databaseServices.insertData(FolderTableConstants.tableName,folderJson);
  }

  @override
  Future<List<Folder>> getFolders() async{
    List<Map<String,dynamic>> foldersJson= await databaseServices.getAllData(FolderTableConstants.tableName);
    return foldersJson.map((json) => FolderModelMapper.fromJson(json)).toList();

  }
}