import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:polo/core/resourses/app_styles.dart';
import 'package:polo/core/resourses/colors.dart';

class AppBackHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const AppBackHeader({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Size get preferredSize => Size.fromHeight(56.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.maybePop(context),
        icon: Icon(Icons.arrow_back_ios, size: 22.sp),
        color: AppColors.mainText,
      ),
      title: Text(
        title,
        style: AppStyles.bold18.copyWith(fontSize: 18.sp),
      ),
      centerTitle: true,
      actions: actions,
    );
  }
}
