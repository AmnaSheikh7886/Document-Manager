import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_file_picker_app/Global/colors.dart';
import 'package:my_file_picker_app/Global/icon.dart';
import 'package:my_file_picker_app/Global/screen_size.dart';

Widget fileWidget({
  required context,
  required String name,
  required String createdAt,
  required IconData icon
}) {
  ScreenSize.init(context);
  return Container(
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      border: Border.all(
        color: AppColors.lightestGray.withOpacity(0.40),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.shadow.withOpacity(0.05),
          spreadRadius: 0,
          blurRadius: 22.5,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      children: [
        Expanded(
          child: Icon(icon,color: AppColors.primaryBlue,),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(7),
                bottomRight: Radius.circular(7),
              ),
            ),

            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: ScreenSize.height * 0.004),

                  Expanded(
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      createdAt,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lighterBlack,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenSize.height * 0.004),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
