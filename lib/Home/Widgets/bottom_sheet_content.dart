import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:my_file_picker_app/Global/colors.dart';
import 'package:my_file_picker_app/Home/Widgets/colors_grid.dart';
import 'package:my_file_picker_app/CustomWidgets/custom_button.dart';
import 'package:my_file_picker_app/CustomWidgets/custom_text_field.dart';

Widget bottomSheetContent(
  RxBool isValid,
  RxBool isSelected,
  RxInt selectedIndex,
  TextEditingController folderName,
  List<Color> colors,
  Callback onCancel,
  Callback onCreate,
  Callback onClear,
) {
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Create Folder",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 20),
          // TextField
          customTextField(folderName, onClear, "Type Folder Name", isValid),
          SizedBox(height: 20),
          // Color Grid to choosing color
          Text(
            "Choose the Color",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: colorsGrid(colors, selectedIndex),
          ),

          // validation of selected color
          Obx(() {
            return isSelected.value
                ? SizedBox()
                : Column(
                    children: [
                      SizedBox(height: 8),
                      Center(
                        child: Text(
                          "*Please Choose any color!",
                          style: TextStyle(
                            color: AppColors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  );
          }),

          //buttons create and cancel
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
            child: Row(
              children: [
                Expanded(
                  child: customButton(
                    "Cancel",
                    onCancel,
                    AppColors.cancelButton,
                    AppColors.black,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: customButton(
                    "Create",
                    onCreate,
                    AppColors.createButton,
                    AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
