import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget goalCard({required String name,required String cal}){
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 12.w),
    child: Container(
      height: 60.h,
      width:double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(18),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5.w,),
              Text(
                cal,
                style: TextStyle(
                  color: Color(0xFFFB4958),
                  fontSize: 23.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5.w,),
              Text(
                ' Kcal',
                style: TextStyle(
                  color: Color(0xFFFB4958),
                  fontSize: 23.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}