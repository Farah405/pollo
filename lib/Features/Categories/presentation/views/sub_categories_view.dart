import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:polo/Features/Home/Data/data/home_mock_data.dart';
import 'package:polo/Features/Home/Data/models/category_model.dart';
import 'package:polo/Features/Home/presentation/widgets/available_service_card.dart';
import 'package:polo/Features/Home/presentation/widgets/product_list_card.dart';
import 'package:polo/core/resourses/app_routes.dart';
import 'package:polo/core/resourses/app_styles.dart';
import 'package:polo/core/resourses/colors.dart';
import 'package:polo/core/widgets/app_back_header.dart';

class SubCategoriesView extends StatefulWidget {
  const SubCategoriesView({super.key});

  @override
  State<SubCategoriesView> createState() => _SubCategoriesViewState();
}

class _SubCategoriesViewState extends State<SubCategoriesView> {
  void _refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;
    final subCategories = HomeMockData.subCategoriesFor(category.id);
    final allProducts = HomeMockData.productsForCategory(category.id);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBackHeader(title: category.title),
      body: subCategories.isEmpty && allProducts.isEmpty
          ? _EmptyState(categoryTitle: category.title)
          : CustomScrollView(
              slivers: [
                if (subCategories.isNotEmpty) ...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 8.h),
                      child: Text('Subcategories', style: AppStyles.bold18),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 190.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 24.w),
                        itemCount: subCategories.length,
                        itemBuilder: (context, index) {
                          final service = subCategories[index];
                          return AvailableServiceCard(
                            service: service,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.products,
                                arguments: service,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
                if (allProducts.isNotEmpty) ...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 8.h),
                      child: Text('All Products', style: AppStyles.bold18),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final product = allProducts[index];
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
                        childCount: allProducts.length,
                      ),
                    ),
                  ),
                ],
                SliverToBoxAdapter(child: SizedBox(height: 24.h)),
              ],
            ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String categoryTitle;

  const _EmptyState({required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 64.sp,
              color: AppColors.icon,
            ),
            SizedBox(height: 16.h),
            Text(
              'No items in $categoryTitle yet',
              textAlign: TextAlign.center,
              style: AppStyles.medium16.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
