import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resourses/app_routes.dart';
import '../../../../core/resourses/app_styles.dart';
import '../../../../core/resourses/colors.dart';
import '../widgets/auth_field_label.dart';
import '../widgets/auth_screen_body.dart';
import '../widgets/auth_subtitle.dart';
import '../widgets/custom_auth_button_.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/social_login.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (name.text.isEmpty ||
        email.text.isEmpty ||
        password.text.isEmpty ||
        password.text != confirmPassword.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields and match passwords'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    setState(() => _isLoading = false);
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.home,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthScreenBody(
      headerTitle: 'Sign Up',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h),
          const AuthSubtitle(text: 'Create your new account'),
          SizedBox(height: 30.h),
          const AuthFieldLabel(label: 'Name'),
          SizedBox(height: 8.h),
          CustomTextField(
            hint: 'Enter your name',
            icon: Icons.person_outline,
            controller: name,
          ),
          SizedBox(height: 18.h),
          const AuthFieldLabel(label: 'Email'),
          SizedBox(height: 8.h),
          CustomTextField(
            hint: 'Enter your email',
            icon: Icons.email_outlined,
            controller: email,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 18.h),
          const AuthFieldLabel(label: 'Phone'),
          SizedBox(height: 8.h),
          CustomTextField(
            hint: 'Enter your phone',
            icon: Icons.phone_outlined,
            controller: phone,
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 18.h),
          const AuthFieldLabel(label: 'Password'),
          SizedBox(height: 8.h),
          CustomTextField(
            hint: 'Enter your password',
            icon: Icons.lock_outline,
            obscure: true,
            controller: password,
          ),
          SizedBox(height: 18.h),
          const AuthFieldLabel(label: 'Confirm Password'),
          SizedBox(height: 8.h),
          CustomTextField(
            hint: 'Confirm your password',
            icon: Icons.lock_outline,
            obscure: true,
            controller: confirmPassword,
          ),
          SizedBox(height: 35.h),
          CustomAuthButton(
            text: 'Sign Up',
            isLoading: _isLoading,
            onTap: _signUp,
          ),
          SizedBox(height: 25.h),
          Center(child: Text('Or continue with', style: AppStyles.grey14)),
          SizedBox(height: 25.h),
          const SocialLogin(),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account?', style: AppStyles.grey14),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.signIn);
                },
                child: Text(
                  'Sign In',
                  style: AppStyles.medium14.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
