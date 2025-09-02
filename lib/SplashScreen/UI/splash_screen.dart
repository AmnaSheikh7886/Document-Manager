import 'package:my_file_picker_app/SplashScreen/UI/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashScreenController>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("File Picker \n POC APP",
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 26
        ),),
      ),
    );
  }
}