import 'dart:io';

import 'package:my_file_picker_app/DataPicker/data_picker.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerImplementation implements DataPicker
{
  XFile? _pickedData;

  @override
  Future<File?> pickData() async{
   _pickedData=await ImagePicker().pickImage(source: ImageSource.gallery);
   if (_pickedData != null) {
     return File(_pickedData!.path);
   }
   return null;
  }
}