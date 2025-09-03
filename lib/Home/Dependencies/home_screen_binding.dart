import 'package:my_file_picker_app/Data/Database/Drift/Services/drift_database_services_impl.dart';
import 'package:my_file_picker_app/Data/Database/Drift/drift_database.dart';
import 'package:my_file_picker_app/Data/Manager/folder_manager_impl.dart';
import 'package:my_file_picker_app/Home/UI/home_screen_controller.dart';
import 'package:get/get.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController(manager: FolderManagerImpl(databaseServices: DriftDatabaseServicesImpl(database: Get.find<AppDatabase>()))));
  }
}
