import 'package:flutter/material.dart';
import 'package:polo/Features/Home/Data/data/home_mock_data.dart';
import 'package:polo/Features/Home/Data/models/category_model.dart';
import 'package:polo/Features/Home/presentation/widgets/available_service_card.dart';
import 'package:polo/core/resourses/app_routes.dart';
import 'package:polo/core/resourses/app_styles.dart';
import 'package:polo/core/resourses/colors.dart';
import 'package:polo/core/widgets/app_back_header.dart';

class SubCategoriesView extends StatelessWidget {
  const SubCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as CategoryModel;
    final subCategories = HomeMockData.subCategoriesFor(category.id);
    final allProducts = HomeMockData.productsForCategory(category.id);

    return Scaffold(
      appBar: AppBackHeader(title: category.title),
      body: subCategories.isEmpty && allProducts.isEmpty
          ? _EmptyState(categoryTitle: category.title)
          : CustomScrollView(
              slivers: [
                if (subCategories.isNotEmpty) ...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                      child: Text(
                        'Subcategories',
                        style: AppStyles.bold18,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 210,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(left: 24),
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
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 20, 24, 8),
                    child: Text(
                      'All Products',
                      style: AppStyles.bold18,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product = allProducts[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: _ProductGridTile(
                            product: product,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.productDetails,
                                arguments: product,
                              );
                            },
                          ),
                        );
                      },
                      childCount: allProducts.length,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 24)),
              ],
            ),
    );
  }
}

class _ProductGridTile extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;

  const _ProductGridTile({
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(12),
              ),
              child: Image.asset(
                product.image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: AppStyles.bold16.copyWith(fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: AppStyles.bold18.copyWith(
                        color: AppColors.primary,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 64,
              color: AppColors.icon,
            ),
            const SizedBox(height: 16),
            Text(
              'No items in $categoryTitle yet',
              textAlign: TextAlign.center,
              style: AppStyles.medium16.copyWith(color: AppColors.secondaryText),
            ),
          ],
        ),
      ),
    );
  }
}
