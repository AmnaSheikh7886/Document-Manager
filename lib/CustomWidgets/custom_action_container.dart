import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:my_file_picker_app/CustomWidgets/custom_box_shadow.dart';
import 'package:my_file_picker_app/Global/colors.dart';
import 'package:my_file_picker_app/Global/screen_size.dart';

Widget customActionContainer({required context,required String text, required double fontSize,required String icon,required Callback action})
{
  ScreenSize.init(context);
  return GestureDetector(
      onTap: action,
      child: Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        customBoxShadow(opacity: 0.1)
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(icon),
        SizedBox(height: ScreenSize.height * 0.0125),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
      )
  );
}