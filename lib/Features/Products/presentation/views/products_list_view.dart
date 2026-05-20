import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:polo/Features/Home/Data/data/home_mock_data.dart';
import 'package:polo/Features/Home/Data/models/category_model.dart';
import 'package:polo/Features/Home/presentation/widgets/product_list_card.dart';
import 'package:polo/core/resourses/app_routes.dart';
import 'package:polo/core/resourses/app_styles.dart';
import 'package:polo/core/resourses/colors.dart';
import 'package:polo/core/widgets/app_back_header.dart';

class ProductsListView extends StatefulWidget {
  const ProductsListView({super.key});

  @override
  State<ProductsListView> createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  void _refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final subCategory =
        ModalRoute.of(context)!.settings.arguments as SubCategoryModel;
    final products = HomeMockData.productsForSubCategory(subCategory.id);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBackHeader(
        title: subCategory.title,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.search,
                arguments: subCategory.title,
              );
            },
            icon: Icon(Icons.search, size: 24.sp),
          ),
        ],
      ),
      body: products.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.inventory_2_outlined,
                    size: 64.sp,
                    color: AppColors.icon,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'No products found',
                    style: AppStyles.medium16.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(24.w),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductListCard(
                  product: product,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.productDetails,
                      arguments: product,
                    ).then((_) => _refresh());
                  },
                  onFavoriteTap: () {
                    HomeMockData.toggleFavorite(product.id);
                    _refresh();
                  },
                );
              },
            ),
    );
  }
}
