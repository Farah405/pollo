import 'package:flutter/material.dart';

class AuthFieldModel {

  final String hint;

  final IconData icon;

  final bool obscure;

  AuthFieldModel({
    required this.hint,
    required this.icon,
    this.obscure = false,
  });
}