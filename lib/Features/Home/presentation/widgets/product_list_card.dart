import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:polo/Features/Home/Data/models/category_model.dart';
import 'package:polo/core/resourses/app_styles.dart';
import 'package:polo/core/resourses/colors.dart';

class ProductListCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;
  final VoidCallback? onFavoriteTap;

  const ProductListCard({
    super.key,
    required this.product,
    required this.onTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 14.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.border.withValues(alpha: 0.6)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Hero(
              tag: 'product_${product.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  product.image,
                  width: 90.w,
                  height: 90.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: AppStyles.bold16.copyWith(fontSize: 15.sp),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16.sp),
                      SizedBox(width: 4.w),
                      Text(
                        '${product.rating}',
                        style: AppStyles.regular14.copyWith(fontSize: 13.sp),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '(${product.reviews})',
                        style: AppStyles.grey14.copyWith(fontSize: 12.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: AppStyles.bold18.copyWith(
                      color: AppColors.primary,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
            if (onFavoriteTap != null)
              IconButton(
                onPressed: onFavoriteTap,
                icon: Icon(
                  product.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: product.isFavorite
                      ? AppColors.primary
                      : AppColors.icon,
                  size: 24.sp,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
