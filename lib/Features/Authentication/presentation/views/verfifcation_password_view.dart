import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/resourses/app_routes.dart';
import '../../../../core/resourses/app_styles.dart';
import '../../../../core/resourses/colors.dart';
import '../widgets/auth_screen_body.dart';
import '../widgets/auth_subtitle.dart';
import '../widgets/custom_auth_button_.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreenBody(
      headerTitle: 'Verification',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          const AuthSubtitle(
            text: 'Enter the verification code sent to your email.',
          ),
          SizedBox(height: 40.h),
          PinCodeTextField(
            appContext: context,
            length: 4,
            keyboardType: TextInputType.number,
            animationType: AnimationType.fade,
            enableActiveFill: true,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(12.r),
              fieldHeight: 60.h,
              fieldWidth: 60.w,
              activeFillColor: AppColors.fieldFillColor,
              selectedFillColor: AppColors.fieldFillColor,
              inactiveFillColor: AppColors.fieldFillColor,
              activeColor: AppColors.primary,
              selectedColor: AppColors.primary,
              inactiveColor: AppColors.border,
            ),
            onChanged: (_) {},
          ),
          SizedBox(height: 40.h),
          CustomAuthButton(
            text: 'Verify',
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.resetPassword);
            },
          ),
          SizedBox(height: 20.h),
          Center(
            child: TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Verification code resent'),
                  ),
                );
              },
              child: Text(
                'Resend Code',
                style: AppStyles.medium14.copyWith(color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
