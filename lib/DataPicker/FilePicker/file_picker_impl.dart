import 'dart:io';
import 'package:my_file_picker_app/DataPicker/data_picker.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerImplementation implements DataPicker {

  FilePickerResult? _pickedData;
  List<String> extensionAllowed;


  FilePickerImplementation({required this.extensionAllowed});

  @override
  Future<File?> pickData() async {
    _pickedData = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions:extensionAllowed
    );
    if (_pickedData != null) {
      return File(_pickedData!.files.single.path!);
    }
    return null;
  }
  }
