import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_file_picker_app/CustomWidgets/custom_action_container.dart';
import 'package:my_file_picker_app/Global/colors.dart';
import 'package:my_file_picker_app/Global/icon.dart';
import 'package:my_file_picker_app/Global/screen_size.dart';
import 'package:my_file_picker_app/Home/UI/home_screen_controller.dart';
import 'package:my_file_picker_app/Home/Widgets/folder_widget.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: ScreenSize.height * 0.04),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.width * 0.05,
                vertical: ScreenSize.height * 0.03,
              ),
              child: SizedBox(
                height: ScreenSize.height * 0.242,
                width: ScreenSize.width,
                child: customActionContainer(
                  context: context,
                  text: "Create Folder",
                  fontSize: 22,
                  icon: AppImages.addFolderIcon,
                  action: controller.onAddFolder,
                ),
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
                        "Folders",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
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
                                return GestureDetector(
                                  onTap: () => controller.onViewFolder(index),
                                  child: folder(
                                    context: context,
                                    name: controller.folders[index].name,
                                    createdAt:
                                        controller.folders[index].createdAt,
                                    count: controller.folders[index].filesCount,
                                    color:
                                        controller.colors[controller
                                            .folders[index]
                                            .color],
                                  ),
                                );
                              },
                              itemCount: controller.folders.length,
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
