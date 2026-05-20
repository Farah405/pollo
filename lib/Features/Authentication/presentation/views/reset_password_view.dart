import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resourses/app_routes.dart';
import '../widgets/auth_field_label.dart';
import '../widgets/auth_screen_body.dart';
import '../widgets/auth_subtitle.dart';
import '../widgets/custom_auth_button_.dart';
import '../widgets/custom_text_field.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  void dispose() {
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  void _resetPassword() {
    if (_password.text.isEmpty ||
        _password.text != _confirmPassword.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords must match')),
      );
      return;
    }
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.signIn,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthScreenBody(
      headerTitle: 'Reset Password',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          const AuthSubtitle(
            text: 'Create a new password for your account.',
          ),
          SizedBox(height: 35.h),
          const AuthFieldLabel(label: 'New Password'),
          SizedBox(height: 8.h),
          CustomTextField(
            hint: 'Enter new password',
            icon: Icons.lock_outline,
            obscure: true,
            controller: _password,
          ),
          SizedBox(height: 18.h),
          const AuthFieldLabel(label: 'Confirm Password'),
          SizedBox(height: 8.h),
          CustomTextField(
            hint: 'Confirm new password',
            icon: Icons.lock_outline,
            obscure: true,
            controller: _confirmPassword,
          ),
          SizedBox(height: 40.h),
          CustomAuthButton(
            text: 'Reset Password',
            onTap: _resetPassword,
          ),
        ],
      ),
    );
  }
}
