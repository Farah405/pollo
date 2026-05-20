import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:polo/Features/Home/Data/data/home_mock_data.dart';
import 'package:polo/Features/Home/presentation/widgets/category_grid_card.dart';
import 'package:polo/core/resourses/app_routes.dart';
import 'package:polo/core/widgets/app_back_header.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBackHeader(title: 'Categories'),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: GridView.builder(
          itemCount: HomeMockData.categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 14.h,
            crossAxisSpacing: 14.w,
            childAspectRatio: 1.05,
          ),
          itemBuilder: (context, index) {
            final category = HomeMockData.categories[index];
            return CategoryGridCard(
              category: category,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.subCategories,
                  arguments: category,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
