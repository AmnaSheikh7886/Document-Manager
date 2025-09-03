import 'package:get/get.dart';
import 'package:my_file_picker_app/Data/Database/Drift/Services/drift_database_services_impl.dart';
import 'package:my_file_picker_app/Data/Database/Drift/drift_database.dart';
import 'package:my_file_picker_app/Data/Database/SQLite/sq_lite_impl.dart';
import 'package:my_file_picker_app/Data/Manager/file_manager_impl.dart';
import 'package:my_file_picker_app/InsideFolderScreen/UI/inside_folder_screen_controller.dart';

class InsideFolderScreenBinding extends Bindings
{
  @override
  void dependencies() {
    Get.put(InsideFolderScreenController(manager: FileManagerImpl(databaseServices: DriftDatabaseServicesImpl(database: Get.find<AppDatabase>()))));
  }
}