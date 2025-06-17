import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    required this.textEditingController,
    this.fontSize,
    this.fontWeight,
    this.lineHeight,
    this.bacgroundColor = const Color(0xFFE9EBF0),
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIconPath,
    this.width,
    this.fillColor,
    this.textColor,
    this.borderSide,
  });

  final String? hintText;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? lineHeight;
  final TextEditingController textEditingController;
  final Color? bacgroundColor;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? prefixIconPath;
  final double? width;
  final Color? fillColor;
  final Color? textColor;
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: 40.h,
      width: screenWidth * 0.9,
      child: TextFormField(
        controller: textEditingController,
        obscureText: obscureText,
        validator: validator,
        style: GoogleFonts.poppins(
          fontSize: fontSize ?? 16.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          height: lineHeight ?? 24.h / 16.h,
          color: AppColors.whiteColor,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: fontSize ?? 14.sp,
            fontWeight: fontWeight ?? FontWeight.w300,
            height: lineHeight ?? 24.h / 16.h,
            color: Colors.white,
          ),
          prefixIcon:
              prefixIconPath != null
                  ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Image.asset(
                      prefixIconPath!,
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.contain,
                    ),
                  )
                  : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: borderSide ?? BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: borderSide ?? BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: borderSide ?? BorderSide.none,
          ),
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: fillColor ?? const Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
