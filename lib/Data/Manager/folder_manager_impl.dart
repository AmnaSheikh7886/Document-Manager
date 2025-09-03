import 'package:intl/intl.dart';
import 'package:my_file_picker_app/Data/Database/Drift/Services/drift_database_services.dart';
import 'package:my_file_picker_app/Data/Manager/folder_manager.dart';
import 'package:my_file_picker_app/Data/Model/folder_model.dart';
import 'package:uuid/uuid.dart';

class FolderManagerImpl implements FolderManager {
  final Uuid uuid = Uuid();
  String get _id => uuid.v4();
  String get _time => DateFormat('dd MMMM yyyy').format(DateTime.now());

  DriftDatabaseServices databaseServices;

  FolderManagerImpl({required this.databaseServices});

  @override
  Future<void> createFolder(String name, int color) async {
    final String id = _id;
    final String createdAt = _time;
    Folder folder = Folder(
      id: id,
      name: name,
      createdAt: createdAt,
      color: color,
    );
    return databaseServices.createFolder(folder);
  }

  @override
  Future<List<Folder>> getFolders() async {
    return await databaseServices.getAllFolders();
  }

  @override
  Stream<List<Folder>> watchFolders() {
    return databaseServices.watchAllFolders();
  }
}
