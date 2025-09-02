import 'dart:io';
import 'package:my_file_picker_app/CustomWidgets/custom_button.dart';
import 'package:my_file_picker_app/CustomWidgets/custom_text_field.dart';
import 'package:my_file_picker_app/Data/Manager/file_manager.dart';
import 'package:my_file_picker_app/Data/Model/file_model.dart';
import 'package:my_file_picker_app/DataPicker/data_picker.dart';
import 'package:my_file_picker_app/Global/colors.dart';
import 'package:my_file_picker_app/Global/folder_table_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;


class PickFileScreenController extends GetxController {
  RxList<FileModel> list = <FileModel>[].obs;
  final args = Get.arguments as Map<String, dynamic>;
  String get folderId  => args[FolderTableConstants.id];
  String get folderName => args[FolderTableConstants.name];
  FileManager manager;
  DataPicker picker;

  PickFileScreenController({required this.manager, required this.picker});

  @override
  void onInit() {
    super.onInit();
    list.assignAll(manager.uploadFiles());
  }

  void onAdd() async {
    File? pickedData= await picker.pickData();
    if (pickedData != null) {
      final sizeOfFile = await pickedData.length();
      final sizeOfFileKB=sizeOfFile/1000;
      final String pathOfFile = pickedData.path;
      final String nameOfFile = p.basenameWithoutExtension(pathOfFile);
      final String extension = p.extension(pathOfFile);
      manager.temporarySaveFile(fileName: nameOfFile, path: pathOfFile, extension: extension, size: sizeOfFileKB.toStringAsFixed(1), parentId: folderId);
    }
    list.value = manager.uploadFiles();
    list.refresh();
  }

  void onDeleteImage(int index) {
    manager.deleteFile(index);
    list.value = manager.uploadFiles();
    list.refresh();
  }

  void onEdit(int index) {
    TextEditingController name = TextEditingController();
    name.text=list[index].name;
    editingBottomSheet(index, name);
  }

  void editingBottomSheet(int index, TextEditingController name) {
    RxBool isValid = true.obs;
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Edit Name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            customTextField(name, ()=>name.text="","Type File Name", isValid),
            SizedBox(height: 12),

           Padding(
             padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 30),
             child: Row(
                  children: [
                    Expanded(child: customButton("Cancel", onBack, AppColors.cancelButton,AppColors.black)),
                    SizedBox(width: 15),
                    Expanded(
                      child: customButton(
                        "Save",
                        (){
                          onSaveEdit(name, index, isValid);
                        },
                        AppColors.primaryBlue,
                        AppColors.white
                      ),
                    ),
                  ],
                ),
           )
          ],
        ),
      ),
    );
  }

  void onSaveEdit(TextEditingController name, int index, RxBool isValid) {
    if (name.text.isEmpty) {
      isValid.value = false;
    } else if (name.text.contains(" ")) {
      isValid.value = false;
    } else {
      manager.editFileName(index, name.text);
      list.value = manager.uploadFiles();
      list.refresh();
      Get.back();
    }
  }

  void onBack()
  {
    Get.back();
  }

  void onSaveFiles()async
  {
    await manager.permanentlySavefiles(folderId);
    Get.back(result: true);
  }
}
