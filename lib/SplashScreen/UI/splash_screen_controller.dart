import 'dart:io';
import 'package:my_file_picker_app/DeviceInfo/device_info.dart';
import 'package:my_file_picker_app/Global/routes_name.dart';
import 'package:my_file_picker_app/Permissions/app_permissions.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreenController extends GetxController {
  AppPermissions permissions;
  DeviceInformation deviceInformation;

  SplashScreenController({required this.permissions,required this.deviceInformation});

  @override
  void onInit() async {
    super.onInit();
    checkAndNavigation();
  }

  void checkAndNavigation()
  {
    Future.delayed(Duration(seconds: 3), () async {
      getPermission();
    });
  }


  void getPermission()async
  {
    int sdkVersion= await deviceInformation.getDeviceSdkVersion();
    if(sdkVersion>=30)
    {
      _getPhotosPermission();
    }
    else
    {
      _getStoragePermission();
    }
  }

  void _getPhotosPermission()async
  {
    bool? granted;
    granted = await permissions.getPhotosPermission();
    if (granted == null) {
      if (permissions.isPhotosPermissionPermanentlyDenied()) {
        openAppSettings();
      }
    } else {
      if (granted) {
        Get.offNamed(Routes.home);
      } else {
        exit(0);
      }
    }
  }
  void _getStoragePermission()async
  {
    bool? granted;
    granted = await permissions.getStoragePermission();
    if (granted == null) {
      if (permissions.isStoragePermissionPermanentlyDenied()) {
        openAppSettings();
      }
    } else {
      if (granted) {
        Get.offNamed(Routes.home);
      } else {
        exit(0);
      }
    }
  }

}
