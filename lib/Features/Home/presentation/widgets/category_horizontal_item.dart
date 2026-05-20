import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:polo/Features/Home/Data/models/category_model.dart';
import 'package:polo/core/resourses/app_styles.dart';
import 'package:polo/core/resourses/colors.dart';
import 'package:polo/core/widgets/gradient_icon.dart';

class CategoryHorizontalItem extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onTap;

  const CategoryHorizontalItem({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 76.w,
        child: Column(
          children: [
            Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: AppColors.border.withValues(alpha: 0.5),
                ),
              ),
              child: Center(
                child: GradientIcon(icon: category.icon, size: 28.sp),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              category.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.medium14.copyWith(
                fontSize: 11.sp,
                color: AppColors.mainText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
