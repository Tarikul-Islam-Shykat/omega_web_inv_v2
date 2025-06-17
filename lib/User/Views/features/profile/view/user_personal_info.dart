import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/User/Views/features/Home/widgets/user_profile_header.dart';
import 'package:omega_web_inv/User/subscription/controller/user_subscription_controller.dart';

class UserPersonalInfo extends StatelessWidget {
  UserPersonalInfo({super.key});
  final subscriptionController = Get.find<SubscriptionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 12.w,
            right: 12.w,
            top: 20.h,
            bottom: 120.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserProfileHeader(
                showBackButton: true,
                showGreetingPrefix: true,
                subtitleText: 'Personal Info!',
                showNotificationIcon: false,
              ),
              SizedBox(height: 20.h),
              _buildInfoText('Age : 21/04/1980'),
              _buildInfoText('Gender : Female'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoText('Fitness Goal : Lose Weight, Build Muscle'),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/edit.png',
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
                ],
              ),
              _buildInfoText('Referral Code : 225674'),
              _buildInfoText('Total Referrals : 02'),
              _buildInfoText('Get 1 Month Premium.'),
              SizedBox(height: 12.h),
              Wrap(
                alignment: WrapAlignment.spaceAround,
                spacing: 8.w,
                runSpacing: 8.h,
                children: [
                  _buildStatChip('Starting Weight : 98'),
                  _buildStatChip('Present Weight : 72 cm'),
                  _buildStatChip('Starting Chest : 148 cm'),
                  _buildStatChip('Present Chest : 95 cm'),
                  _buildStatChip('Starting Hips : 100 cm'),
                  _buildStatChip('Present Hips : 95 cm'),
                  _buildStatChip('Starting Waist : 75 cm'),
                  _buildStatChip('Present Waist : 80 cm'),
                  _buildStatChip('Starting Arms : 120 cm'),
                  _buildStatChip('Present Arms : 90 cm'),
                ],
              ),
              SizedBox(height: 24.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF351316),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Image.asset('assets/images/logos.png', height: 36.h),
                          SizedBox(height: 10.h),
                          Text(
                            'Premium Tier',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '\$9.99/month',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    ...[
                      'Full workout library',
                      'AI-personalized plans',
                      'Full fitness + nutrition tracking',
                      'Health app integrations',
                      'Supplement recommendations + links',
                      'Priority support',
                    ].map(
                      (e) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: Row(
                          children: [
                            Icon(Icons.check, color: Colors.white, size: 16.sp),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Text(
                                e,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    _buildPlanStatus(
                      'Plan Activated - 29/04/2025',
                      Colors.transparent,
                      Colors.red,
                      border: true,
                    ),
                    SizedBox(height: 10.h),
                    _buildPlanStatus(
                      'Renewal Date - 29/05/2025',
                      Colors.white,
                      Colors.red,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Center(
                child: Obx(() {
                  if (subscriptionController.selectedPlanName.isEmpty) {
                    return Text(
                      "No Plan Selected",
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    );
                  }

                  return Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFF351316),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/logos.png',
                                height: 36.h,
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                subscriptionController.selectedPlanName.value,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                subscriptionController.selectedPlanPrice.value,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.h),
                        ...subscriptionController.selectedPlanFeatures.map(
                          (e) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 16.sp,
                                ),
                                SizedBox(width: 8.w),
                                Expanded(
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        _buildPlanStatus(
                          'Plan Activated - ${subscriptionController.activationDate.value}',
                          Colors.transparent,
                          Colors.red,
                          border: true,
                        ),
                        SizedBox(height: 10.h),
                        _buildPlanStatus(
                          'Renewal Date - ${subscriptionController.renewalDate.value}',
                          Colors.white,
                          Colors.red,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoText(String text) => Padding(
    padding: EdgeInsets.only(bottom: 6.h),
    child: Text(text, style: TextStyle(color: Colors.white, fontSize: 14.sp)),
  );

  Widget _buildStatChip(String label) => Container(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
    decoration: BoxDecoration(
      color: Color(0xFFFFFFFF).withAlpha(18),
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: Text(
      label,
      style: TextStyle(
        color: Colors.white,
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  Widget _buildPlanStatus(
    String text,
    Color bgColor,
    Color textColor, {
    bool border = false,
  }) => Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(vertical: 12.h),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(12.r),
      border: border ? Border.all(color: textColor, width: 1.5) : null,
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
