import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedItem;
  final String label;
  final double width;
  final Color fillColor;
  final void Function(T?)? onChanged;
  final bool enabled;
  final String Function(T)? itemAsString;

  const CommonDropdown({
    required this.items,
    required this.selectedItem,
    required this.label,
    this.onChanged,
    this.itemAsString,
    this.enabled = true,
    required this.width,
    required this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: DropdownButtonFormField<T>(
        style: TextStyle(
          color: const Color(0xFFFFFFFF),
          fontSize: 14.sp,
        ),
        dropdownColor: Colors.black,
        alignment: AlignmentDirectional.centerStart, // Changed from centerEnd
        hint: Text(
          label,
          style: TextStyle(
            color: const Color(0xFFFFFFFF).withOpacity(0.7),
            fontSize: 14.sp,
          ),
        ),
        value: selectedItem,
        onChanged: enabled ? onChanged : null,
        items: items.map((T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: Text(
              itemAsString != null ? itemAsString!(value) : value.toString(),
              style: TextStyle(
                color: const Color(0xFFFFFFFF),
                fontSize: 14.sp,
              ),
            ),
          );
        }).toList(),
        decoration: InputDecoration(
          fillColor: fillColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 8.h,
            horizontal: 12.w,
          ),
        ),
        // icon: Icon(
        //   Icons.arrow_drop_down,
        //   color: Colors.white,
        // ),
        iconSize: 24.sp,
        isExpanded: true, // Add this to prevent overflow
        menuMaxHeight: 300.h, // Limit dropdown height
      ),
    );
  }
}