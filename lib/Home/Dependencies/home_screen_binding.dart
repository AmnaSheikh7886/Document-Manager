import 'package:my_file_picker_app/Data/Database/SQLite/sq_lite_impl.dart';
import 'package:my_file_picker_app/Data/Manager/folder_manager_impl.dart';
import 'package:my_file_picker_app/Home/UI/home_screen_controller.dart';
import 'package:get/get.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController(manager: FolderManagerImpl(databaseServices: SqLiteImpl())));
  }
}
