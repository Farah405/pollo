import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resourses/app_routes.dart';
import '../widgets/auth_field_label.dart';
import '../widgets/auth_screen_body.dart';
import '../widgets/auth_subtitle.dart';
import '../widgets/custom_auth_button_.dart';
import '../widgets/custom_text_field.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController _email = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScreenBody(
      headerTitle: 'Forget Password?',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          const AuthSubtitle(
            text:
                'Don’t worry! Enter your email and we’ll send you a verification code.',
          ),
          SizedBox(height: 35.h),
          const AuthFieldLabel(label: 'Email'),
          SizedBox(height: 8.h),
          CustomTextField(
            hint: 'Enter your email',
            icon: Icons.email_outlined,
            controller: _email,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 40.h),
          CustomAuthButton(
            text: 'Send Code',
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.verification);
            },
          ),
        ],
      ),
    );
  }
}
