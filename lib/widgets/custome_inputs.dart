import 'package:flutter/material.dart';

class CustomeInputField extends StatelessWidget {
  final Color? fillColor;
  final bool obscureText;
  final String hintText;
  final double radius;
  final BorderSide borderSide;
  const CustomeInputField({
    super.key,
    this.fillColor,
    required this.obscureText,
    required this.hintText,
    required this.radius,
    required this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    if (obscureText) {
      return TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          hintStyle: const TextStyle(fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: borderSide,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          suffixIcon: const Icon(Icons.visibility, color: Color(0xFF433939)),
          hintText: hintText,
        ),
        obscureText: obscureText,
      );
    } else {
      return TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          hintStyle: const TextStyle(fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: borderSide,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          hintText: hintText,
        ),
      );
    }
  }
}
