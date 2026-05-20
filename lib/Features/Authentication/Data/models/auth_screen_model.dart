import 'auth_field_model.dart';

class AuthScreenModel {

  final String title;

  final String subtitle;

  final String buttonText;

  final bool hasSocialLogin;

  final bool hasForgetPassword;

  final bool hasFooter;

  final List<AuthFieldModel> fields;

  AuthScreenModel({

    required this.title,

    required this.subtitle,

    required this.buttonText,

    required this.fields,

    this.hasSocialLogin = false,

    this.hasForgetPassword = false,

    this.hasFooter = false,
  });
}