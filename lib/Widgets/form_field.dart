import 'package:flutter/material.dart';

class form_field extends StatelessWidget {
  final int maxLines;
  final String? Function(String?) validator;
  const form_field({
    super.key,
    required this.maxLines,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFFFFFFF),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFE5E7EB), width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: validator,
    );
  }
}
