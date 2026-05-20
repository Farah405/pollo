import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:polo/Features/Home/Data/data/home_mock_data.dart';
import 'package:polo/Features/Home/Data/models/category_model.dart';
import 'package:polo/Features/Home/presentation/widgets/product_list_card.dart';
import 'package:polo/Features/Search/presentation/widgets/filter_bottom_sheet.dart';
import 'package:polo/core/resourses/app_routes.dart';
import 'package:polo/core/resourses/app_styles.dart';
import 'package:polo/core/resourses/colors.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();
  String _sortBy = 'Relevance';
  double _minPrice = 0;
  double _maxPrice = 500;
  String? _selectedCategoryId;

  static const _recentSearches = [
    'Cat Food',
    'Veterinary',
    'Poultry',
    'Cattle',
  ];

  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      final hint = ModalRoute.of(context)?.settings.arguments;
      if (hint is String && hint.isNotEmpty) {
        _controller.text = hint;
      }
      _initialized = true;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<ProductModel> get _filteredProducts {
    var results = HomeMockData.searchProducts(_controller.text);
    if (_selectedCategoryId != null) {
      results =
          results.where((p) => p.categoryId == _selectedCategoryId).toList();
    }
    results = results
        .where((p) => p.price >= _minPrice && p.price <= _maxPrice)
        .toList();
    switch (_sortBy) {
      case 'Price: Low to High':
        results.sort((a, b) => a.price.compareTo(b.price));
      case 'Price: High to Low':
        results.sort((a, b) => b.price.compareTo(a.price));
      case 'Rating':
        results.sort((a, b) => b.rating.compareTo(a.rating));
    }
    return results;
  }

  void _openFilter() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => FilterBottomSheet(
        sortBy: _sortBy,
        minPrice: _minPrice,
        maxPrice: _maxPrice,
        selectedCategoryId: _selectedCategoryId,
        onApply: (sort, min, max, categoryId) {
          setState(() {
            _sortBy = sort;
            _minPrice = min;
            _maxPrice = max;
            _selectedCategoryId = categoryId;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final results = _filteredProducts;
    final showRecent = _controller.text.isEmpty;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, size: 22.sp),
        ),
        title: _SearchField(
          controller: _controller,
          onChanged: (_) => setState(() {}),
        ),
        actions: [
          IconButton(
            onPressed: _openFilter,
            icon: const Icon(Icons.tune),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_selectedCategoryId != null || _sortBy != 'Relevance')
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: [
                  if (_sortBy != 'Relevance')
                    _FilterChip(
                      label: _sortBy,
                      onRemove: () => setState(() => _sortBy = 'Relevance'),
                    ),
                  if (_selectedCategoryId != null)
                    _FilterChip(
                      label: HomeMockData.categories
                          .firstWhere((c) => c.id == _selectedCategoryId)
                          .title,
                      onRemove: () =>
                          setState(() => _selectedCategoryId = null),
                    ),
                ],
              ),
            ),
          if (showRecent) ...[
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 8.h),
              child: Text('Recent Searches', style: AppStyles.bold16),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: _recentSearches.map((term) {
                  return ActionChip(
                    label: Text(term, style: AppStyles.medium14),
                    backgroundColor: AppColors.card,
                    side: BorderSide(
                      color: AppColors.border.withValues(alpha: 0.6),
                    ),
                    onPressed: () {
                      _controller.text = term;
                      setState(() {});
                    },
                  );
                }).toList(),
              ),
            ),
          ],
          Padding(
            padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 8.h),
            child: Text(
              showRecent ? 'Popular Products' : '${results.length} results',
              style: AppStyles.grey14,
            ),
          ),
          Expanded(
            child: (showRecent ? HomeMockData.products : results).isEmpty
                ? _EmptySearch()
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    itemCount:
                        showRecent ? HomeMockData.products.length : results.length,
                    itemBuilder: (context, index) {
                      final product = showRecent
                          ? HomeMockData.products[index]
                          : results[index];
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
    );
  }
}

class _EmptySearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 64.sp, color: AppColors.icon),
          SizedBox(height: 12.h),
          Text(
            'No products found',
            style: AppStyles.medium16.copyWith(color: AppColors.secondaryText),
          ),
        ],
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const _SearchField({
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      decoration: BoxDecoration(
        color: AppColors.fieldFillColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        autofocus: true,
        style: AppStyles.medium14,
        decoration: InputDecoration(
          hintText: 'Search products...',
          hintStyle: AppStyles.grey14,
          prefixIcon: Icon(Icons.search, color: AppColors.icon, size: 22.sp),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const _FilterChip({
    required this.label,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label, style: AppStyles.medium14.copyWith(fontSize: 12.sp)),
      deleteIcon: Icon(Icons.close, size: 16.sp),
      onDeleted: onRemove,
      backgroundColor: AppColors.lightPrimary.withValues(alpha: 0.2),
    );
  }
}
