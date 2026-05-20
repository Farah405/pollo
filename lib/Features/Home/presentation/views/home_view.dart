import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:polo/Features/Home/Data/data/home_mock_data.dart';

import 'package:polo/Features/Home/presentation/widgets/available_service_card.dart';

import 'package:polo/Features/Home/presentation/widgets/category_grid_card.dart';

import 'package:polo/Features/Home/presentation/widgets/category_horizontal_item.dart';

import 'package:polo/Features/Home/presentation/widgets/home_banner_carousel.dart';

import 'package:polo/core/resourses/app_routes.dart';

import 'package:polo/core/resourses/app_styles.dart';

import 'package:polo/core/resourses/colors.dart';

import 'package:polo/core/widgets/app_drawer.dart';

import 'package:polo/core/widgets/home_search_bar.dart';

import 'package:polo/core/widgets/section_header.dart';



class HomeView extends StatefulWidget {

  const HomeView({super.key});



  @override

  State<HomeView> createState() => _HomeViewState();

}



class _HomeViewState extends State<HomeView> {

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.background,

      drawer: const AppDrawer(),

      body: SafeArea(

        child: RefreshIndicator(

          color: AppColors.primary,

          onRefresh: () async {

            await Future.delayed(const Duration(milliseconds: 600));

            setState(() {});

          },

          child: CustomScrollView(

            physics: const AlwaysScrollableScrollPhysics(),

            slivers: [

              SliverToBoxAdapter(child: _buildTopBar(context)),

              SliverToBoxAdapter(child: SizedBox(height: 12.h)),

              SliverToBoxAdapter(

                child: HomeSearchBar(

                  onTap: () {

                    Navigator.pushNamed(context, AppRoutes.search);

                  },

                ),

              ),

              SliverToBoxAdapter(child: SizedBox(height: 16.h)),

              SliverToBoxAdapter(

                child: HomeBannerCarousel(banners: HomeMockData.banners),

              ),

              SliverToBoxAdapter(child: SizedBox(height: 24.h)),

              SliverToBoxAdapter(

                child: SectionHeader(

                  title: 'Categories',

                  actionLabel: 'See all',

                  onActionTap: () {

                    Navigator.pushNamed(context, AppRoutes.categories);

                  },

                ),

              ),

              SliverToBoxAdapter(child: SizedBox(height: 14.h)),

              SliverToBoxAdapter(

                child: SizedBox(

                  height: 90.h,

                  child: ListView.separated(

                    scrollDirection: Axis.horizontal,

                    padding: EdgeInsets.symmetric(horizontal: 24.w),

                    itemCount: HomeMockData.categories.length,

                    separatorBuilder: (_, index) => SizedBox(width: 16.w),

                    itemBuilder: (context, index) {

                      final category = HomeMockData.categories[index];

                      return CategoryHorizontalItem(

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

              ),

              SliverToBoxAdapter(child: SizedBox(height: 24.h)),

              SliverPadding(

                padding: EdgeInsets.symmetric(horizontal: 24.w),

                sliver: SliverGrid(

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                    crossAxisCount: 2,

                    mainAxisSpacing: 14.h,

                    crossAxisSpacing: 14.w,

                    childAspectRatio: 1.05,

                  ),

                  delegate: SliverChildBuilderDelegate(

                    (context, index) {

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

                    childCount: HomeMockData.categories.length,

                  ),

                ),

              ),

              SliverToBoxAdapter(child: SizedBox(height: 28.h)),

              SliverToBoxAdapter(

                child: SectionHeader(

                  title: 'Available',

                  actionLabel: 'See all',

                  onActionTap: () {

                    Navigator.pushNamed(context, AppRoutes.categories);

                  },

                ),

              ),

              SliverToBoxAdapter(child: SizedBox(height: 14.h)),

              SliverToBoxAdapter(

                child: SizedBox(

                  height: 190.h,

                  child: ListView.builder(

                    scrollDirection: Axis.horizontal,

                    padding: EdgeInsets.only(left: 24.w),

                    itemCount: HomeMockData.availableServices.length,

                    itemBuilder: (context, index) {

                      final service = HomeMockData.availableServices[index];

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

              SliverToBoxAdapter(child: SizedBox(height: 24.h)),

            ],

          ),

        ),

      ),

    );

  }



  Widget _buildTopBar(BuildContext context) {

    return Padding(

      padding: EdgeInsets.fromLTRB(8.w, 8.h, 16.w, 0),

      child: Row(

        children: [

          Builder(

            builder: (ctx) => IconButton(

              onPressed: () => Scaffold.of(ctx).openDrawer(),

              icon: Icon(Icons.menu, size: 28.sp),

              color: AppColors.mainText,

            ),

          ),

          Expanded(

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text('Hello 👋', style: AppStyles.grey14),

                Text('Pollo Store', style: AppStyles.bold20),

              ],

            ),

          ),

          IconButton(

            onPressed: () {

              Navigator.pushNamed(context, AppRoutes.search);

            },

            icon: Icon(Icons.search, size: 28.sp),

            color: AppColors.mainText,

          ),

          IconButton(

            onPressed: () {

              Navigator.pushNamed(context, AppRoutes.favorites);

            },

            icon: Icon(Icons.favorite_border, size: 28.sp),

            color: AppColors.mainText,

          ),

        ],

      ),

    );

  }

}


