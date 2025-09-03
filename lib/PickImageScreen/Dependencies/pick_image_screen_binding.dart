import 'package:get/get.dart';
import 'package:my_file_picker_app/Data/Database/Drift/Services/drift_database_services_impl.dart';
import 'package:my_file_picker_app/Data/Database/Drift/drift_database.dart';
import 'package:my_file_picker_app/Data/Manager/file_manager_impl.dart';
import 'package:my_file_picker_app/DataPicker/ImagePicker/image_picker_impl.dart';
import 'package:my_file_picker_app/PickImageScreen/UI/pick_image_screen_controller.dart';

class PickImageScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PickImageScreenController(
        manager: FileManagerImpl(databaseServices: DriftDatabaseServicesImpl(database: Get.find<AppDatabase>())),
        picker: ImagePickerImplementation(),
      ),
    );
  }
}
