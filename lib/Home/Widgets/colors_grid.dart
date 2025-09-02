import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_file_picker_app/Global/colors.dart';

Widget colorsGrid(List<Color> colors, RxInt selectedIndex) {
  return GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 5,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
    ),
    itemBuilder: (context, index) {
      return GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: colors[index],
            borderRadius: BorderRadius.circular(50),
          ),
          child: Obx(() {
            return selectedIndex.value == index
                ? Icon(Icons.check, color: AppColors.white, size: 30)
                : SizedBox();
          }),
        ),
        onTap: () {
          selectedIndex.value = index;
        },
      );
    },
    itemCount: colors.length,
  );
}
