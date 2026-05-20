import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:polo/core/resourses/app_routes.dart';
import 'package:polo/core/resourses/app_styles.dart';
import 'package:polo/core/resourses/assets.dart';
import 'package:polo/core/resourses/colors.dart';
import 'package:polo/core/widgets/tab_page_header.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TabPageHeader(
                title: 'My Account',
                subtitle: 'Manage your profile and settings',
              ),
              _ProfileHeader(),
              SizedBox(height: 12.h),
              _AccountTile(
                icon: Icons.person_outline,
                title: 'Edit Profile',
                onTap: () {},
              ),
              _AccountTile(
                icon: Icons.shopping_bag_outlined,
                title: 'My Orders',
                onTap: () {},
              ),
              _AccountTile(
                icon: Icons.location_on_outlined,
                title: 'Addresses',
                onTap: () {},
              ),
              _AccountTile(
                icon: Icons.notifications_outlined,
                title: 'Notifications',
                onTap: () {},
              ),
              _AccountTile(
                icon: Icons.lock_outline,
                title: 'Change Password',
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.forgetPassword);
                },
              ),
              _AccountTile(
                icon: Icons.help_outline,
                title: 'Help & Support',
                onTap: () {},
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SizedBox(
                  width: double.infinity,
                  height: 55.h,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.signIn,
                        (route) => false,
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.error),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    child: Text(
                      'Sign Out',
                      style: AppStyles.medium16.copyWith(
                        color: AppColors.error,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(3.w),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppColors.appGradient,
          ),
          child: CircleAvatar(
            radius: 50.r,
            backgroundColor: AppColors.background,
            child: ClipOval(
              child: Image.asset(
                AppImages.onboarding1,
                width: 96.w,
                height: 96.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 14.h),
        Text('John Doe', style: AppStyles.bold20),
        SizedBox(height: 4.h),
        Text('john.doe@pollo.com', style: AppStyles.grey14),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          decoration: BoxDecoration(
            gradient: AppColors.appGradient,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            'Premium Member',
            style: AppStyles.medium14.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class _AccountTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _AccountTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Icon(icon, color: AppColors.primary, size: 22.sp),
      ),
      title: Text(title, style: AppStyles.medium16),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16.sp,
        color: AppColors.icon,
      ),
      onTap: onTap,
    );
  }
}
