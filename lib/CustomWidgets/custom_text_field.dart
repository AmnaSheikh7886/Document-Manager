import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:my_file_picker_app/Global/colors.dart';

Widget customTextField(
  TextEditingController textController,
  Callback action,
  String hint,
  RxBool isValid,
) {
  return Column(
    children: [
      TextField(
        controller: textController,
        cursorColor: AppColors.black,
        cursorWidth: 1.5,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.primaryBackground,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.lighterBlack,
          ),
          suffixIcon: IconButton(onPressed: action, icon: Icon(Icons.clear)),
          suffixIconColor: AppColors.lighterBlack,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGray),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lighterBlack),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      // Validating TextField
      Obx(() {
        return isValid.value
            ? SizedBox()
            : Column(
                children: [
                  SizedBox(height: 8),
                  Center(
                    child: Text(
                      "*The Name is Invalid!",
                      style: TextStyle(
                        color: AppColors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              );
      }),
    ],
  );
}
