import 'package:get/get.dart';
import 'package:my_file_picker_app/Data/Database/Drift/drift_database.dart';
import 'package:my_file_picker_app/Data/Database/SQLite/db_helper.dart';

class GlobalBinding extends Bindings
{
  @override
  void dependencies() {
    _initializingDatabases();
  }

  void _initializingDatabases()
  {
    Get.lazyPut(()=>DatabaseHelper());
    Get.lazyPut(()=>AppDatabase());

  }
}