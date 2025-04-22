import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final String prefixIconPath;
  final String? suffixIconPath;

  CustomTextFormField({
    required this.label,
    this.obscureText = false,
    required this.prefixIconPath,
    this.suffixIconPath,
  });

  Widget _buildIcon(String path) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: SvgPicture.asset(
        path,
        width: 24,
        height: 24,
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: label,
          prefixIcon: _buildIcon(prefixIconPath),
          suffixIcon: suffixIconPath != null ? _buildIcon(suffixIconPath!) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
        ),
      ),
    );
  }
}
