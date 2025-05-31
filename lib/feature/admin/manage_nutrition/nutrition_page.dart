// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, deprecated_member_use

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prettyrini/feature/admin/manage_nutrition/controller/admin_goal_controller.dart';
import 'package:prettyrini/feature/admin/manage_nutrition/controller/admin_meal_plan_controller.dart';
import 'package:prettyrini/feature/admin/manage_nutrition/model/nutrition_model.dart';

class AdminNutritionPage extends StatelessWidget {
  final AdminMealPlanController controller = Get.put(AdminMealPlanController());

  final AdminGoalController gcontroller = Get.put(AdminGoalController());

  final List<AdminNutritionModel> nutritions = [
    AdminNutritionModel(
      quantity: '150 gm',
      kcal: '140',
      calories: 300,
      title: 'Oats + Banana (Breakfast)',
      thumbnailUrl: 'assets/images/user.png',
      imagePath: 'assets/images/meal1.png',
      centerImagePath: 'assets/images/pause.png',
    ),
    AdminNutritionModel(
      quantity: '6 pcs',
      kcal: '210',
      calories: 300,
      title: 'Rice, Grilled, Veggies (Lunch)',
      thumbnailUrl: 'assets/images/user.png',
      imagePath: 'assets/images/meal2.png',
      centerImagePath: 'assets/images/pause.png',
    ),
    AdminNutritionModel(
      quantity: '150 gm',
      kcal: '200',
      calories: 200,
      title: 'Salad + Soup (Dinner)',
      thumbnailUrl: 'assets/images/user.png',
      imagePath: 'assets/images/meal3.png',
      centerImagePath: 'assets/images/pause.png',
    ),
    AdminNutritionModel(
      quantity: '120 gm',
      kcal: '120',
      calories: 200,
      title: 'Salad + Soup (snack)',
      thumbnailUrl: 'assets/images/user.png',
      imagePath: 'assets/images/meal1.png',
      centerImagePath: 'assets/images/pause.png',
    ),
  ];

  AdminNutritionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final titleFontSize = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: screenHeight * 0.05,
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.1),
                    Text(
                      'Manage Nutrition',
                      style: TextStyle(
                        color: Color(0xffF5838C).withValues(alpha: 1),
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text(
                      'Manage Nutrition',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '03',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              CustomDropdownWithFilter(nutritions: nutritions, sw: sw),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.all(16.w),
                child: SizedBox(
                  width: sw * 0.95,
                  height: 40.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(16.r),
                          right: Radius.circular(16.r),
                        ),
                      ),
                      backgroundColor: Colors.redAccent,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Your Nutritionist',
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 120.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _goalCard(double sw) {
    final AdminGoalController goalController = Get.find();

    return Obx(
      () => _buildCard(
        sw,
        'Meal Goals',
        goalController.caloriesEaten.value.split(' ')[0],
      ),
    );
  }

  Widget _selectMealCard(double sw) {
    return Obx(
      () => _buildCard(
        sw,
        'Select Meal',
        '${controller.remainingCalories.value}',
      ),
    );
  }

  Widget _buildCard(double sw, String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Container(
        height: 60.h,
        width: sw * 0.95,
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
                Text(
                  '$title',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    color: Color(0xFFFB4958),
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' Kcal',
                  style: TextStyle(
                    color: Color(0xFFFB4958),
                    fontSize: 26.sp,
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
}

class CustomDropdownWithFilter extends StatefulWidget {
  final List<AdminNutritionModel> nutritions;
  final double sw;

  const CustomDropdownWithFilter({
    super.key,
    required this.nutritions,
    required this.sw,
  });

  @override
  State<CustomDropdownWithFilter> createState() =>
      _CustomDropdownWithFilterState();
}

class _CustomDropdownWithFilterState extends State<CustomDropdownWithFilter> {
  bool _isDropdownOpen = false;
  final List<String> _options = ['Breakfast', 'Lunch', 'Dinner', 'Snack'];
  final List<bool> _selectedOptions = [false, false, false, false];
  List<AdminNutritionModel> _filteredNutritions = [];
  final Set<int> _selectedIndices = {};
  final AdminMealPlanController controller = Get.find();

  @override
  void initState() {
    super.initState();
    _filteredNutritions = widget.nutritions;
  }

  void _toggleDropdown() {
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
    });
  }

  void _toggleOption(int index) {
    setState(() {
      _selectedOptions[index] = !_selectedOptions[index];
      _filterNutritions();
    });
  }

  void _filterNutritions() {
    List<String> selectedMealTimes = [];
    for (int i = 0; i < _selectedOptions.length; i++) {
      if (_selectedOptions[i]) {
        selectedMealTimes.add(_options[i]);
      }
    }

    if (selectedMealTimes.isEmpty) {
      _filteredNutritions = widget.nutritions;
    } else {
      _filteredNutritions = widget.nutritions.where((nutrition) {
        return selectedMealTimes.any(
          (time) => nutrition.title.contains(time),
        );
      }).toList();
    }
  }

  void _toggleSelection(int index) {
    setState(() {
      if (_selectedIndices.contains(index)) {
        _selectedIndices.remove(index);
        controller.remainingCalories.value -=
            _filteredNutritions[index].calories; // Fixed to subtract calories
      } else {
        _selectedIndices.add(index);
        controller.remainingCalories.value +=
            _filteredNutritions[index].calories;
      }
    });
  }

  Widget _nutritionCard({
    required AdminNutritionModel nutrition,
    required int index,
  }) {
    final isSelected = _selectedIndices.contains(index);

    return GestureDetector(
      onTap: () => _toggleSelection(index),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.white.withAlpha(18),
            border: isSelected
                ? Border.all(color: Colors.redAccent, width: 2)
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Row(
                  children: [
                    Image.asset(
                      nutrition.thumbnailUrl,
                      width: 60.w,
                      height: 60.h,
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nutrition.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Suggest Nutrition Library',
                      style: TextStyle(
                        color: Color(0xFFF5838C),
                        fontSize: 12.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        log('See all tapped');
                        // Get.to(() => NutritionLibrary());
                      },
                      child: Row(
                        children: [
                          Text(
                            'Nutrition Tips',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          Icon(Icons.arrow_right, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: _nutritionItem(nutrition)),
                    Flexible(child: _nutritionItem(nutrition)),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nutritionItem(AdminNutritionModel nutrition) {
    return Container(
      width: 130.w,
      height: 90.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: DecorationImage(
          image: AssetImage(nutrition.imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.2),
            BlendMode.darken,
          ),
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.white.withAlpha(18),
              child: Image.asset(
                nutrition.centerImagePath,
                width: 10.w,
                height: 10.h,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(30),
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              child: Row(
                children: [
                  Text(
                    nutrition.quantity,
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.local_fire_department,
                    size: 14.sp,
                    color: Colors.white,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    nutrition.kcal,
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Suggest Meals',
                    style: TextStyle(color: Color(0xFFF5838C), fontSize: 20.sp),
                  ),
                  GestureDetector(
                    onTap: _toggleDropdown,
                    child: Row(
                      children: [
                        Text(
                          'Filter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Image.asset(
                          'assets/images/filter.png',
                          height: 24.h,
                          width: 24.w,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _filteredNutritions.length,
              itemBuilder: (context, index) {
                final nutrition = _filteredNutritions[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: _nutritionCard(nutrition: nutrition, index: index),
                );
              },
            ),
          ],
        ),
        if (_isDropdownOpen)
          Positioned(
            right: 16.w,
            top: 30.h,
            child: Container(
              width: 200.w,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select meal time',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Transform.rotate(
                          angle: 4.71,
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ...List.generate(_options.length, (index) {
                    return GestureDetector(
                      onTap: () => _toggleOption(index),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(18),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            children: [
                              Checkbox(
                                value: _selectedOptions[index],
                                onChanged: (value) => _toggleOption(index),
                                activeColor: Colors.transparent,
                                checkColor: Colors.white,
                                side: BorderSide(color: Colors.white),
                              ),
                              Text(
                                _options[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
