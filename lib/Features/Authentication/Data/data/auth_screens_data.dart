import 'package:flutter/material.dart';

import '../models/auth_field_model.dart';
import '../models/auth_screen_model.dart';

final signInModel = AuthScreenModel(

  title: 'Sign In',

  subtitle: 'Sign in to your account',

  buttonText: 'Sign In',

  hasSocialLogin: true,

  hasForgetPassword: true,

  hasFooter: true,

  fields: [

    AuthFieldModel(
      hint: 'Email',
      icon: Icons.email_outlined,
    ),

    AuthFieldModel(
      hint: 'Password',
      icon: Icons.lock_outline,
      obscure: true,
    ),
  ],
);

final signUpModel = AuthScreenModel(

  title: 'Sign Up',

  subtitle: 'Create your new account',

  buttonText: 'Sign Up',

  hasSocialLogin: true,

  fields: [

    AuthFieldModel(
      hint: 'Name',
      icon: Icons.person_outline,
    ),

    AuthFieldModel(
      hint: 'Email',
      icon: Icons.email_outlined,
    ),

    AuthFieldModel(
      hint: 'Phone',
      icon: Icons.phone_outlined,
    ),

    AuthFieldModel(
      hint: 'Password',
      icon: Icons.lock_outline,
      obscure: true,
    ),

    AuthFieldModel(
      hint: 'Confirm Password',
      icon: Icons.lock_outline,
      obscure: true,
    ),
  ],
);

final forgetPasswordModel = AuthScreenModel(

  title: 'Forget Password',

  subtitle:
  'Enter your email to receive reset code',

  buttonText: 'Send Code',

  fields: [

    AuthFieldModel(
      hint: 'Email',
      icon: Icons.email_outlined,
    ),
  ],
);