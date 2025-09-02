import 'package:my_file_picker_app/DeviceInfo/device_info_impl.dart';
import 'package:my_file_picker_app/Permissions/app_permissions_impl.dart';
import 'package:my_file_picker_app/SplashScreen/UI/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashScreenController(
        permissions: AppPermissionsImplementation(),
        deviceInformation: DeviceInformationImplementation(),
      ),
    );
  }
}
