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
    _watchFiles();
  }

  void _watchFiles()
  {
    manager.watchFiles(folderId).listen((List<FileModel> newFiles){
      files.value=newFiles;
    });
  }
  void onImportFile(){
    Get.toNamed(
        Routes.pickFile,
        arguments: {
          FolderTableConstants.name: folderName,
          FolderTableConstants.id: folderId,
        },
      );

  }

  void onImportImage(){
    Get.toNamed(
      Routes.pickImage,
      arguments: {
        FolderTableConstants.name: folderName,
        FolderTableConstants.id: folderId,
      },
    );
  }

  void onBack()
  {
    Get.back();
  }
}
