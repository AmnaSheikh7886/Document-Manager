import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_file_picker_app/CustomWidgets/custom_box_shadow.dart';
import 'package:my_file_picker_app/Global/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:my_file_picker_app/Global/icon.dart';
import 'package:my_file_picker_app/Global/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_file_picker_app/PickFileScreen/UI/pick_file_controller.dart';

class PickFileScreen extends GetView<PickFileScreenController> {
  const PickFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenSize.width * 0.05,
            vertical: ScreenSize.height * 0.04,
          ),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap:controller.onBack,
                      child: Icon(Icons.arrow_back_sharp, size: 26),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap:controller.onSaveFiles,
                      child: Row(
                        children: [
                          Icon(
                            Icons.check,
                            size: 30,
                            color: AppColors.primaryBlue,
                          ),
                          Text(
                            "Save",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenSize.height * 0.035),
                Container(
                  width: ScreenSize.width,
                  height:  ScreenSize.height * 0.075,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primaryBackground,
                    border: Border.all(
                      color: AppColors.lightestGray.withOpacity(0.4),
                      width: 1,
                    ),
                    boxShadow: [
                      customBoxShadow(opacity: 0.03)
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppImages.folderIcon),
                        SizedBox(width: ScreenSize.width*0.025,),
                        Expanded(
                          child: Text(controller.folderName
                          ,style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis
                            ),),
                        ),
                        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_sharp,size: 20,))

                      ],
                    ),
                  ),
                ),
                SizedBox(height: ScreenSize.height * 0.035),

                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(15),
                  color: AppColors.lightGray,
                  padding: EdgeInsets.symmetric(
                    vertical: ScreenSize.height * 0.02,
                  ),
                  strokeWidth: 1.5,
                  dashPattern: [6, 4],
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: controller.onAdd,
                          icon: Icon(
                            Icons.add_circle_outline_sharp,
                            color: AppColors.primaryBlue,
                            size: 27,
                          ),
                        ),
                        Text(
                          "Upload your Files",
                          style: TextStyle(
                            color: AppColors.primaryBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: ScreenSize.height * 0.012),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: ScreenSize.height * 0.035),
                Expanded(
                  child: Obx(() {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              height: ScreenSize.height * 0.08709,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow:[ customBoxShadow(opacity: 0.15)
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppImages.fileIcon),
                                    SizedBox(width: ScreenSize.width * 0.03),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${controller.list[index].name}${controller.list[index].extension}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(
                                            height: ScreenSize.height * 0.001,
                                          ),
                                          Text(
                                            "${controller.list[index].size} KB",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.gary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        controller.onEdit(index);
                                      },
                                      icon: SvgPicture.asset(
                                        AppImages.editIcon,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        controller.onDeleteImage(index);
                                      },
                                      icon: SvgPicture.asset(AppImages.binIcon),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: ScreenSize.height * 0.025),
                          ],
                        );
                      },
                      itemCount: controller.list.length,
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
