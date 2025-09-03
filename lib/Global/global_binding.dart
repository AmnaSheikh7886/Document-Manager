import 'package:get/get.dart';
import 'package:my_file_picker_app/Data/Database/Drift/drift_database.dart';

class GlobalBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut(()=>AppDatabase());
  }
}