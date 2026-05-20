import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:polo/core/resourses/app_styles.dart';
import '../../../../core/resourses/colors.dart';

class AuthHeader extends StatelessWidget {
  final String? title;

  const AuthHeader({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AuthClipper(),
      child: Container(
        height: 150.h,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.appGradient,
        ),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                GestureDetector(
                  onTap: () => Navigator.maybePop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 22.sp,
                  ),
                ),
                if (title != null) ...[
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, bottom: 50.h),
                    child: Text(
                      title!,
                      style: AppStyles.bold24.copyWith(
                        color: Colors.white,
                        fontSize: 32.sp,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuthClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 90);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height + 20,
      size.width * 0.6,
      size.height - 30,
    );
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height - 60,
      size.width,
      size.height - 10,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
