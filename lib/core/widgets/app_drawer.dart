import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:polo/core/resourses/app_routes.dart';
import 'package:polo/core/resourses/app_styles.dart';
import 'package:polo/core/resourses/assets.dart';
import 'package:polo/core/resourses/colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300.w,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: const BoxDecoration(
                gradient: AppColors.appGradient,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 36.r,
                    backgroundColor: Colors.white.withValues(alpha: 0.2),
                    child: ClipOval(
                      child: Image.asset(
                        AppImages.onboarding1,
                        width: 60.w,
                        height: 60.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    'Welcome to Pollo',
                    style: AppStyles.bold18.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'user@pollo.com',
                    style: AppStyles.regular14.copyWith(
                      color: Colors.white.withValues(alpha: 0.85),
                    ),
                  ),
                ],
              ),
            ),
            _DrawerTile(
              icon: Icons.home_outlined,
              title: 'Home',
              onTap: () => Navigator.pop(context),
            ),
            _DrawerTile(
              icon: Icons.category_outlined,
              title: 'Categories',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.categories);
              },
            ),
            _DrawerTile(
              icon: Icons.favorite_border,
              title: 'Favorites',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.favorites);
              },
            ),
            _DrawerTile(
              icon: Icons.add_circle_outline,
              title: 'Add Advertisement',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.addAd);
              },
            ),
            _DrawerTile(
              icon: Icons.person_outline,
              title: 'My Account',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.account);
              },
            ),
            const Divider(height: 1),
            _DrawerTile(
              icon: Icons.settings_outlined,
              title: 'Settings',
              onTap: () => Navigator.pop(context),
            ),
            _DrawerTile(
              icon: Icons.help_outline,
              title: 'Help & Support',
              onTap: () => Navigator.pop(context),
            ),
            const Spacer(),
            ListTile(
              leading: Icon(Icons.logout, color: AppColors.error, size: 24.sp),
              title: Text(
                'Sign Out',
                style: AppStyles.medium16.copyWith(color: AppColors.error),
              ),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.signIn,
                  (route) => false,
                );
              },
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _DrawerTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.icon2, size: 24.sp),
      title: Text(title, style: AppStyles.medium16),
      onTap: onTap,
    );
  }
}
