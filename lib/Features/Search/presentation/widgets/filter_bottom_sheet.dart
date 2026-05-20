import 'package:flutter/material.dart';
import 'package:polo/Features/Home/Data/data/home_mock_data.dart';
import 'package:polo/core/resourses/app_styles.dart';
import 'package:polo/core/resourses/colors.dart';

class FilterBottomSheet extends StatefulWidget {
  final String sortBy;
  final double minPrice;
  final double maxPrice;
  final String? selectedCategoryId;
  final void Function(
    String sort,
    double min,
    double max,
    String? categoryId,
  ) onApply;

  const FilterBottomSheet({
    super.key,
    required this.sortBy,
    required this.minPrice,
    required this.maxPrice,
    required this.selectedCategoryId,
    required this.onApply,
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late String _sortBy;
  late RangeValues _priceRange;
  String? _categoryId;

  static const _sortOptions = [
    'Relevance',
    'Price: Low to High',
    'Price: High to Low',
    'Rating',
  ];

  @override
  void initState() {
    super.initState();
    _sortBy = widget.sortBy;
    _priceRange = RangeValues(widget.minPrice, widget.maxPrice);
    _categoryId = widget.selectedCategoryId;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('Filter', style: AppStyles.bold20),
            const SizedBox(height: 24),
            Text('Sort by', style: AppStyles.bold16),
            const SizedBox(height: 12),
            ..._sortOptions.map(
              (option) => RadioListTile<String>(
                title: Text(option, style: AppStyles.medium14),
                value: option,
                groupValue: _sortBy,
                activeColor: AppColors.primary,
                onChanged: (v) => setState(() => _sortBy = v!),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const SizedBox(height: 16),
            Text('Price range', style: AppStyles.bold16),
            RangeSlider(
              values: _priceRange,
              min: 0,
              max: 500,
              divisions: 50,
              activeColor: AppColors.primary,
              labels: RangeLabels(
                '\$${_priceRange.start.round()}',
                '\$${_priceRange.end.round()}',
              ),
              onChanged: (v) => setState(() => _priceRange = v),
            ),
            const SizedBox(height: 8),
            Text('Category', style: AppStyles.bold16),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                FilterChip(
                  label: const Text('All'),
                  selected: _categoryId == null,
                  onSelected: (_) => setState(() => _categoryId = null),
                  selectedColor: AppColors.lightPrimary.withValues(alpha: 0.4),
                ),
                ...HomeMockData.categories.map(
                  (cat) => FilterChip(
                    label: Text(cat.title),
                    selected: _categoryId == cat.id,
                    onSelected: (_) =>
                        setState(() => _categoryId = cat.id),
                    selectedColor:
                        AppColors.lightPrimary.withValues(alpha: 0.4),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      widget.onApply('Relevance', 0, 500, null);
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: AppColors.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Reset',
                      style: AppStyles.medium16.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: AppColors.appGradient,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        widget.onApply(
                          _sortBy,
                          _priceRange.start,
                          _priceRange.end,
                          _categoryId,
                        );
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Apply',
                        style: AppStyles.medium16.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
