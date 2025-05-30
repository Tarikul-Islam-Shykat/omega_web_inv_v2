import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/User/Views/features/Home/controller/custom_dropdown_controller.dart';

class CustomDropDown extends StatelessWidget {
  final double width;
  final String hintText;
  final String? value;
  final List<String> items;
  final Color fillColor;
  final CustomDropDownController controller;
  final ValueChanged<String?>? onChanged;

  CustomDropDown({
    super.key,
    required this.width,
    required this.hintText,
    this.value,
    required this.items,
    required this.fillColor,
    required this.controller,
    this.onChanged,
  }) {
    controller.initializeItems(items, value);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Text(
              hintText,
              style: TextStyle(color: const Color(0xFFFFFFFF), fontSize: 16.sp),
            ),
            value:
                controller.selectedValue.value.isEmpty
                    ? null
                    : controller.selectedValue.value,
            items:
                items.map((label) {
                  bool showCheckbox = label != "Male" && label != "Female";
                  return DropdownMenuItem<String>(
                    value: label,
                    child: Container(
                      // decoration: BoxDecoration(color: Color(0xFF000000)),
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: 12.w,
                      ),
                      color: const Color(0xFFFFFFFF).withAlpha(18),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF).withAlpha(18),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            children: [
                              if (showCheckbox)
                                Checkbox(
                                  value:
                                      controller.checkboxStates[label] ?? false,
                                  onChanged: (bool? _) {
                                    controller.setSelectedValue(label);
                                    onChanged?.call(label);
                                  },
                                  activeColor: const Color(0xFFFB4958),
                                  checkColor: Colors.white,
                                ),
                              if (showCheckbox) SizedBox(width: 8.w),
                              Text(
                                label,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
            onChanged: (value) {
              controller.setSelectedValue(value);
              onChanged?.call(value);
            },
            selectedItemBuilder: (context) {
              return items.map((label) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    label,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                );
              }).toList();
            },
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: fillColor,
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.zero,
            ),
          ),
        ),
      ),
    );
  }
}
