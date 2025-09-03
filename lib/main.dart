import 'package:my_file_picker_app/Global/colors.dart';
import 'package:my_file_picker_app/Global/global_binding.dart';
import 'package:my_file_picker_app/Global/routes_name.dart';
import 'package:my_file_picker_app/Home/Dependencies/home_screen_binding.dart';
import 'package:my_file_picker_app/Home/UI/home_screen.dart';
import 'package:my_file_picker_app/InsideFolderScreen/Dependencies/inside_folder_screen_binding.dart';
import 'package:my_file_picker_app/InsideFolderScreen/UI/inside_folder_screen.dart';
import 'package:my_file_picker_app/PickFileScreen/Dependencies/pick_file_screen_binding.dart';
import 'package:my_file_picker_app/PickFileScreen/UI/pick_file_screen.dart';
import 'package:my_file_picker_app/PickImageScreen/Dependencies/pick_image_screen_binding.dart';
import 'package:my_file_picker_app/PickImageScreen/UI/pick_image_screen.dart';
import 'package:my_file_picker_app/SplashScreen/Dependencies/splash_screen_binding.dart';
import 'package:my_file_picker_app/SplashScreen/UI/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()
{
  runApp(FilePicker());
}

class FilePicker extends GetView
{
  const FilePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GlobalBinding(),
      debugShowCheckedModeBanner: false,
      title: "File Picker",
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: AppColors.gary,

        )
      ),
      initialRoute: Routes.splash,
      getPages: [
        GetPage(name: Routes.splash, page: ()=>SplashScreen(),binding: SplashScreenBinding()),
        GetPage(name: Routes.pickFile, page: ()=>PickFileScreen(),binding: PickFileScreenBinding()),
        GetPage(name: Routes.pickImage, page: ()=>PickImageScreen(),binding: PickImageScreenBinding()),
        GetPage(name: Routes.home, page: ()=>HomeScreen(),binding: HomeScreenBinding()),
        GetPage(name: Routes.insideFolder, page: ()=>InsideFolderScreen(),binding: InsideFolderScreenBinding())
      ],

    );
  }
}