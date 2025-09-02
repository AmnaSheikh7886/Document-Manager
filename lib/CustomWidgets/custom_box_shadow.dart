import 'package:flutter/cupertino.dart';
import 'package:my_file_picker_app/Global/colors.dart';

BoxShadow customBoxShadow({required double opacity}) {
  return BoxShadow(
    color: AppColors.shadow.withOpacity(opacity),
    spreadRadius: 0,
    blurRadius: 22.5,
    offset: Offset(0, 4),
  );
}
