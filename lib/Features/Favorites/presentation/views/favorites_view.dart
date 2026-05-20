import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:polo/Features/Home/Data/data/home_mock_data.dart';
import 'package:polo/Features/Home/presentation/widgets/product_list_card.dart';
import 'package:polo/core/resourses/app_routes.dart';
import 'package:polo/core/resourses/app_styles.dart';
import 'package:polo/core/resourses/colors.dart';
import 'package:polo/core/widgets/tab_page_header.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    final favorites = HomeMockData.favoriteProducts;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TabPageHeader(
              title: 'Favorites',
              subtitle: 'Products you saved for later',
            ),
            Expanded(
              child: favorites.isEmpty
                  ? const _EmptyFavorites()
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      itemCount: favorites.length,
                      itemBuilder: (context, index) {
                        final product = favorites[index];
                        return ProductListCard(
                          product: product,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.productDetails,
                              arguments: product,
                            ).then((_) => setState(() {}));
                          },
                          onFavoriteTap: () {
                            HomeMockData.toggleFavorite(product.id);
                            setState(() {});
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyFavorites extends StatelessWidget {
  const _EmptyFavorites();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 72.sp, color: AppColors.icon),
          SizedBox(height: 16.h),
          Text(
            'No favorites yet',
            style: AppStyles.bold18.copyWith(color: AppColors.secondaryText),
          ),
          SizedBox(height: 8.h),
          Text('Tap the heart on products you love', style: AppStyles.grey14),
        ],
      ),
    );
  }
}
