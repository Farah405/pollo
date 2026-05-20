import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:polo/core/resourses/colors.dart';
import 'auth_header.dart';

class AuthScreenBody extends StatelessWidget {
  final String? headerTitle;
  final Widget child;

  const AuthScreenBody({
    super.key,
    this.headerTitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.background,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.viewInsetsOf(context).bottom + 24.h,
          ),
          child: Column(
            children: [
              AuthHeader(title: headerTitle),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
