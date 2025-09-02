import 'package:my_file_picker_app/Permissions/app_permissions.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPermissionsImplementation implements AppPermissions {
  late PermissionStatus _photosPermissionStatus;
  late PermissionStatus _storagePermissionStatus;

  @override
  Future<bool?> getPhotosPermission() async {
    _photosPermissionStatus = await Permission.photos.request();
    if(_photosPermissionStatus.isGranted)
      {
        return true;
      }
    else if(_photosPermissionStatus.isDenied)
      {
        return false;
      }
    return null;
  }
  @override
  bool isPhotosPermissionPermanentlyDenied() {
    return _photosPermissionStatus.isPermanentlyDenied ? true : false;
  }

  @override
  Future<bool?> getStoragePermission() async{
    _storagePermissionStatus = await Permission.storage.request();
    if(_storagePermissionStatus.isGranted)
    {
      return true;
    }
    else if(_storagePermissionStatus.isDenied)
    {
      return false;
    }
    return null;
  }

  @override
  bool isStoragePermissionPermanentlyDenied() {
    return _storagePermissionStatus.isPermanentlyDenied ? true : false;
  }
}
