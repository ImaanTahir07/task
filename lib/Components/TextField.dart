
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextFormField textField(TextEditingController controller, String text, String? Function(String?)? validator) {
  return TextFormField(
    controller: controller,
    cursorColor: Colors.black,
    style: GoogleFonts.poppins(color: Colors.black, fontSize: 10.sp),
    decoration: InputDecoration(
      labelText: text,
      labelStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 10.sp),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
    ),
    validator: validator,
  );
}
