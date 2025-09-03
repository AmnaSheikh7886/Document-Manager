abstract class AppPermissions
{
  Future<bool?> getPhotosPermission();
  bool isPhotosPermissionPermanentlyDenied();
  Future<bool?> getStoragePermission();
  bool isStoragePermissionPermanentlyDenied();
}