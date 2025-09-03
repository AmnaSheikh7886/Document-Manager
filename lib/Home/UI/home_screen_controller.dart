import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_file_picker_app/Data/Manager/folder_manager.dart';
import 'package:my_file_picker_app/Data/Model/folder_model.dart';
import 'package:my_file_picker_app/Global/colors.dart';
import 'package:my_file_picker_app/Global/routes_name.dart';
import 'dart:ui';
import 'package:my_file_picker_app/Home/Widgets/bottom_sheet_content.dart';
import '../../Global/folder_table_constants.dart';

class HomeScreenController extends GetxController {
  RxBool isValid = true.obs;
  RxBool isSelected = true.obs;
  RxInt selectedIndex = (-1).obs;
  TextEditingController folderName = TextEditingController();
  late int selectedColor;
  RxList<Folder> folders = <Folder>[].obs;
  FolderManager manager;

  List<Color> colors = [
    AppColors.folderColor1,
    AppColors.folderColor2,
    AppColors.folderColor3,
    AppColors.folderColor4,
    AppColors.folderColor5,
    AppColors.folderColor6,
    AppColors.folderColor7,
    AppColors.folderColor8,
    AppColors.folderColor9,
    AppColors.folderColor10,
  ];

  HomeScreenController({required this.manager});

  @override
  void onInit() {
    super.onInit();
    _watchFolders();
  }

  void _watchFolders() {
    manager.watchFolders().listen((List<Folder> newFolders) {
      folders.value = newFolders;
    });
  }

  void onAddFolder() {
    Get.bottomSheet(
      isScrollControlled: true,
      bottomSheetContent(
        isValid,
        isSelected,
        selectedIndex,
        folderName,
        colors,
        onCancel,
        onCreateButton,
        onClear,
      ),
    );
  }

  void onCreateButton() async {
    bool nameValid = folderName.text.isNotEmpty;
    bool colorSelected = selectedIndex.value != -1;

    isValid.value = nameValid;
    isSelected.value = colorSelected;

    if (nameValid && colorSelected) {
      selectedColor = selectedIndex.value;
      //inserting folder
      await manager.createFolder(folderName.text, selectedColor);
      //back to normal
      _normalState();
      Get.back();
    }
  }

  void onCancel() {
    Get.back();
    //back to normal
    _normalState();
  }

  void onClear() {
    folderName.text = "";
  }

  void _normalState() {
    isValid.value = true;
    isSelected.value = true;
    selectedIndex.value = -1;
    folderName.text = "";
  }

  void onViewFolder(int index) {
    Get.toNamed(
      Routes.insideFolder,
      arguments: {
        FolderTableConstants.name: folders[index].name,
        FolderTableConstants.id: folders[index].id,
      },
    );
  }
}
