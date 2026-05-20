import 'package:flutter/material.dart';
import 'package:polo/core/resourses/app_styles.dart';

class AuthFieldLabel extends StatelessWidget {
  final String label;

  const AuthFieldLabel({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(label, style: AppStyles.bold16);
  }
}
