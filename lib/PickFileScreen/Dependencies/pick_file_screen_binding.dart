import 'package:my_file_picker_app/Data/Database/Drift/Services/drift_database_services_impl.dart';
import 'package:my_file_picker_app/Data/Database/Drift/drift_database.dart';
import 'package:my_file_picker_app/Data/Database/SQLite/sq_lite_impl.dart';
import 'package:my_file_picker_app/Data/Manager/file_manager_impl.dart';
import 'package:my_file_picker_app/DataPicker/FilePicker/file_picker_impl.dart';
import 'package:my_file_picker_app/PickFileScreen/UI/pick_file_controller.dart';
import 'package:get/get.dart';

class PickFileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
          () => PickFileScreenController(
        manager: FileManagerImpl(databaseServices: DriftDatabaseServicesImpl(database: Get.find<AppDatabase>())),
        picker: FilePickerImplementation(extensionAllowed: ['pdf','doc', 'docx','ppt', 'pptx','txt']),
      ),
    );
  }
}
