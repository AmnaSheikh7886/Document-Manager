import 'package:permission_handler/permission_handler.dart';

abstract class AppPermissions
{
  Future<bool?> getPhotosPermission();
  bool isPhotosPermissionPermanentlyDenied();
  Future<bool?> getStoragePermission();
  bool isStoragePermissionPermanentlyDenied();
}