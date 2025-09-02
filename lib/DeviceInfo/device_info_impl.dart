import 'package:my_file_picker_app/DeviceInfo/device_info.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInformationImplementation implements DeviceInformation
{
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  @override
  Future<int> getDeviceSdkVersion()async {
    AndroidDeviceInfo androidDeviceInfo=await deviceInfoPlugin.androidInfo;
    return androidDeviceInfo.version.sdkInt;
  }

}