import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_file_picker_app/CustomWidgets/custom_action_container.dart';
import 'package:my_file_picker_app/Global/colors.dart';
import 'package:my_file_picker_app/Global/file_icon_mapper.dart';
import 'package:my_file_picker_app/Global/icon.dart';
import 'package:my_file_picker_app/Global/screen_size.dart';
import 'package:my_file_picker_app/InsideFolderScreen/UI/inside_folder_screen_controller.dart';
import 'package:my_file_picker_app/InsideFolderScreen/Widgets/file_widget.dart';

class InsideFolderScreen extends GetView<InsideFolderScreenController> {
  const InsideFolderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: ScreenSize.height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.width * 0.05,
                vertical: ScreenSize.height * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  GestureDetector(
                    onTap: controller.onBack,
                    child: Icon(Icons.arrow_back_sharp, size: 26),
                  ),
                  SizedBox(height: ScreenSize.height * 0.02),
                  SizedBox(
                    height: ScreenSize.height * 0.12,
                    child: Row(
                      children: [
                        Expanded(
                          child: customActionContainer(
                            context: context,
                            text: "Import Files",
                            fontSize: 14,
                            icon: AppImages.addFilesIcon,
                            action: controller.onImportFile,
                          ),
                        ),
                        SizedBox(width: ScreenSize.width * 0.05),
                        Expanded(
                          child: customActionContainer(
                            context: context,
                            text: "Import Images",
                            fontSize: 14,
                            icon: AppImages.addImagesIcon,
                            action: controller.onImportImage,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow.withOpacity(0.07),
                      spreadRadius: 0,
                      blurRadius: 63.5,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenSize.width * 0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: ScreenSize.height * 0.04),
                      Text(
                        controller.folderName,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: ScreenSize.height * 0.02,
                          ),
                          child: Obx(() {
                            return GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 12,
                                  ),
                              itemBuilder: (context, index) {
                                return fileWidget(
                                  context: context,
                                  name:
                                      "${controller.files[index].name}${controller.files[index].extension}",
                                  createdAt: controller.files[index].createdAt,icon:FileIcon.fileExtensionIcons[controller.files[index].extension]??Icons.insert_drive_file
                                );
                              },
                              itemCount: controller.files.length,
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
