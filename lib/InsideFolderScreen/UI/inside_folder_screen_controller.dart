import 'package:get/get.dart';
import 'package:my_file_picker_app/Data/Manager/file_manager.dart';
import 'package:my_file_picker_app/Data/Model/file_model.dart';
import 'package:my_file_picker_app/Global/folder_table_constants.dart';
import 'package:my_file_picker_app/Global/routes_name.dart';

class InsideFolderScreenController extends GetxController {
  final args = Get.arguments as Map<String, dynamic>;
  String get folderId => args[FolderTableConstants.id];
  String get folderName => args[FolderTableConstants.name];
  RxList<FileModel> files= <FileModel>[].obs;
  FileManager manager;


  InsideFolderScreenController({required this.manager});
  @override
  void onInit() {
    super.onInit();
    _loadFiles();
  }

  onImportFile() async{
    final result = await Get.toNamed(
      Routes.pickFile,
      arguments: {
        FolderTableConstants.name: folderName,
        FolderTableConstants.id: folderId,
      },
    );
    if (result == true) {
      _loadFiles();
    }
  }

  onImportImage() async{
    final result = await Get.toNamed(
      Routes.pickImage,
      arguments: {
        FolderTableConstants.name: folderName,
        FolderTableConstants.id: folderId,
      },
    );
    if (result == true) {
      _loadFiles();
    }
  }


  void _loadFiles()async
  {
    files.value=await manager.getPermanentFiles(folderId);
  }

  void onBack()
  {
    Get.back();
  }
}
