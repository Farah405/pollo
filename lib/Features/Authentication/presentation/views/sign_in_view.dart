import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resourses/app_routes.dart';
import '../../../../core/resourses/app_styles.dart';
import '../../../../core/resourses/colors.dart';
import '../manger/cubit/auth_cubit.dart';
import '../manger/cubit/auth_states.dart';
import '../widgets/auth_field_label.dart';
import '../widgets/auth_screen_body.dart';
import '../widgets/auth_subtitle.dart';
import '../widgets/custom_auth_button_.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/social_login.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.home,
              (route) => false,
            );
          }
          if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: AppColors.error,
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is LoginLoadingState;

          return AuthScreenBody(
            headerTitle: 'Sign In',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h),
                const AuthSubtitle(text: 'Sign in to your account'),
                SizedBox(height: 30.h),
                const AuthFieldLabel(label: 'Email'),
                SizedBox(height: 8.h),
                CustomTextField(
                  hint: 'Enter your email',
                  icon: Icons.email_outlined,
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20.h),
                const AuthFieldLabel(label: 'Password'),
                SizedBox(height: 8.h),
                CustomTextField(
                  hint: 'Enter your password',
                  icon: Icons.lock_outline,
                  obscure: true,
                  controller: password,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.forgetPassword,
                      );
                    },
                    child: Text(
                      'Forget Password?',
                      style: AppStyles.medium14.copyWith(
                        color: AppColors.primary,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                CustomAuthButton(
                  text: 'Sign In',
                  isLoading: isLoading,
                  onTap: () {
                    if (email.text.isEmpty || password.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter email and password'),
                          backgroundColor: AppColors.error,
                        ),
                      );
                      return;
                    }
                    AuthCubit.get(context).login(
                      email: email.text,
                      password: password.text,
                    );
                  },
                ),
                SizedBox(height: 30.h),
                Center(
                  child: Text('Or continue with', style: AppStyles.grey14),
                ),
                SizedBox(height: 25.h),
                const SocialLogin(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don’t have an account?', style: AppStyles.grey14),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.signUp);
                      },
                      child: Text(
                        'Sign Up',
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
        },
      ),
    );
  }
}
