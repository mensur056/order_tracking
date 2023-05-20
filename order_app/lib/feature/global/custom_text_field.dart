import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.icon,
    required this.controller,
    this.suffixIcon,
    this.obscure,
  });
  final String title;
  final IconData icon;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool? obscure;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xFF3C3E42)),
      child: TextFormField(
        obscureText: obscure ?? false,
        style: GoogleFonts.quicksand(color: Colors.grey, fontSize: 20),
        controller: controller,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            suffixIcon: suffixIcon,
            prefixIcon: Icon(
              icon,
              color: Colors.blue,
            ),
            border: InputBorder.none,
            hintText: title,
            hintStyle: GoogleFonts.quicksand(color: Colors.grey, fontSize: 20)),
      ),
    );
  }
}
