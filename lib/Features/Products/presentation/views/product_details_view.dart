import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:polo/Features/Home/Data/data/home_mock_data.dart';
import 'package:polo/Features/Home/Data/models/category_model.dart';
import 'package:polo/core/resourses/app_styles.dart';
import 'package:polo/core/resourses/colors.dart';
import 'package:polo/core/widgets/app_back_header.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    final product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    final current = HomeMockData.productById(product.id) ?? product;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBackHeader(
        title: 'Product Details',
        actions: [
          IconButton(
            onPressed: () {
              HomeMockData.toggleFavorite(current.id);
              setState(() {});
            },
            icon: Icon(
              current.isFavorite ? Icons.favorite : Icons.favorite_border,
              color:
                  current.isFavorite ? AppColors.primary : AppColors.mainText,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 0),
                    child: Hero(
                      tag: 'product_${current.id}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Image.asset(
                          current.image,
                          width: double.infinity,
                          height: 260.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          current.title,
                          style: AppStyles.bold24.copyWith(fontSize: 22.sp),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 20.sp),
                            SizedBox(width: 6.w),
                            Text(
                              '${current.rating} (${current.reviews} reviews)',
                              style: AppStyles.regular14,
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            '\$${current.price.toStringAsFixed(2)}',
                            style: AppStyles.bold24.copyWith(
                              color: AppColors.primary,
                              fontSize: 22.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Text('Description', style: AppStyles.bold18),
                        SizedBox(height: 8.h),
                        Text(
                          current.description,
                          style: AppStyles.regular14.copyWith(height: 1.6),
                        ),
                        SizedBox(height: 24.h),
                        Text('Quantity', style: AppStyles.bold16),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            _QtyButton(
                              icon: Icons.remove,
                              onTap: () {
                                if (_quantity > 1) {
                                  setState(() => _quantity--);
                                }
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text(
                                '$_quantity',
                                style: AppStyles.bold18,
                              ),
                            ),
                            _QtyButton(
                              icon: Icons.add,
                              onTap: () => setState(() => _quantity++),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildBottomBar(current),
        ],
      ),
    );
  }

  Widget _buildBottomBar(ProductModel product) {
    return Container(
      padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 24.h),
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 55.h,
                decoration: BoxDecoration(
                  gradient: AppColors.appGradient,
                  borderRadius: BorderRadius.circular(30.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Added $_quantity × ${product.title} to cart',
                        ),
                        backgroundColor: AppColors.green,
                      ),
                    );
                  },
                  child: Text(
                    'Add to Cart',
                    style: AppStyles.medium16.copyWith(color: Colors.white),
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

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.border),
        ),
        child: Icon(icon, size: 20.sp, color: AppColors.mainText),
      ),
    );
  }
}
