import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:polo/core/resourses/app_styles.dart';
import 'package:polo/core/resourses/colors.dart';

class AuthSubtitle extends StatelessWidget {
  final String text;

  const AuthSubtitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppStyles.subtitle15,
        ),
        SizedBox(height: 6.h),
        Container(
          width: 40.w,
          height: 4.h,
          decoration: BoxDecoration(
            gradient: AppColors.appGradient,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
      ],
    );
  }
}
