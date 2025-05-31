import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prettyrini/feature/admin/user_profile/controller/user_profile_controller.dart';

class UserProfilePage extends StatelessWidget {
  final UserProfileController controller = Get.put(UserProfileController());

  UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final isDesktop = size.width > 1200;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Obx(() => SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      isDesktop ? size.width * 0.2 : (isTablet ? 32.0 : 16.0),
                  vertical: 16.0,
                ),
                child: Column(
                  children: [
                    _buildHeader(context, isTablet),
                    SizedBox(height: isTablet ? 32 : 24),
                    _buildUserInfo(context, isTablet),
                    SizedBox(height: isTablet ? 32 : 24),
                    _buildMeasurements(context, isTablet),
                    SizedBox(height: isTablet ? 32 : 24),
                    _buildPremiumTier(context, isTablet),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isTablet) {
    return Container(
      padding: EdgeInsets.all(isTablet ? 20 : 16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            iconSize: isTablet ? 28 : 24,
          ),
          SizedBox(width: isTablet ? 20 : 16),
          CircleAvatar(
            radius: isTablet ? 35 : 30,
            backgroundColor: Colors.grey[300],
            child: Icon(
              Icons.person,
              size: isTablet ? 40 : 35,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(width: isTablet ? 20 : 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.user.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isTablet ? 24 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "User Profile",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: isTablet ? 16 : 14,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
            iconSize: isTablet ? 28 : 24,
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context, bool isTablet) {
    final size = MediaQuery.of(context).size;
    final crossAxisCount = size.width > 800 ? 3 : (size.width > 500 ? 2 : 1);

    return Column(
      children: [
        _buildInfoItem("Age", controller.user.age, isTablet),
        _buildInfoItem("Gender", controller.user.gender, isTablet),
        _buildInfoItem("Fitness Goal", controller.user.fitnessGoal, isTablet),
        _buildInfoItem("Referral Code", controller.user.referralCode, isTablet),
        _buildInfoItem("Total Referrals",
            controller.user.totalReferrals.toString(), isTablet),
        _buildInfoItem(
            "Get ${controller.user.premiumMonths} Month Premium", "", isTablet),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value, bool isTablet) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "$label : $value",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildMeasurements(BuildContext context, bool isTablet) {
    final measurements = [
      {
        "label": "Weight",
        "starting": "${controller.user.startingWeight}",
        "present": "${controller.user.presentWeight} cm"
      },
      {
        "label": "Chest",
        "starting": "${controller.user.startingChest} cm",
        "present": "${controller.user.presentChest} cm"
      },
      {
        "label": "Hips",
        "starting": "${controller.user.startingHips} cm",
        "present": "${controller.user.presentHips} cm"
      },
      {
        "label": "Waist",
        "starting": "${controller.user.startingWaist} cm",
        "present": "${controller.user.presentWaist} cm"
      },
      {
        "label": "Arms",
        "starting": "${controller.user.startingArms} cm",
        "present": "${controller.user.presentArms} cm"
      },
    ];

    return Column(
      children: measurements.map((measurement) {
        return Padding(
          padding: EdgeInsets.only(bottom: isTablet ? 16 : 12),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    "Starting ${measurement["label"]} : ${measurement["starting"]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(width: isTablet ? 16 : 12),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isTablet ? 20 : 16,
                    vertical: isTablet ? 16 : 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    "Present ${measurement["label"]} : ${measurement["present"]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPremiumTier(BuildContext context, bool isTablet) {
    return Container(
      padding: EdgeInsets.all(isTablet ? 24 : 20),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(
            Icons.workspace_premium,
            color: Colors.amber,
            size: isTablet ? 50 : 40,
          ),
          SizedBox(height: isTablet ? 16 : 12),
          Text(
            controller.premiumTier.tierName,
            style: TextStyle(
              color: Colors.white,
              fontSize: isTablet ? 24 : 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: isTablet ? 8 : 6),
          Text(
            "\$${controller.premiumTier.monthlyPrice}/month",
            style: TextStyle(
              color: Colors.white,
              fontSize: isTablet ? 20 : 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: isTablet ? 20 : 16),
          ...controller.premiumTier.features
              .map((feature) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green[400],
                          size: isTablet ? 20 : 18,
                        ),
                        SizedBox(width: isTablet ? 12 : 8),
                        Expanded(
                          child: Text(
                            feature,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isTablet ? 16 : 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
          SizedBox(height: isTablet ? 24 : 20),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: isTablet ? 16 : 12),
            decoration: BoxDecoration(
                //     color: Colors.red[800],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red)),
            child: Text(
              'Plan Activated - ${controller.getFormattedDate(controller.premiumTier.planActivatedDate)}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: isTablet ? 16 : 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: isTablet ? 12 : 8),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: isTablet ? 16 : 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Renewal Date - ${controller.getFormattedDate(controller.premiumTier.renewalDate)}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red[800],
                fontSize: isTablet ? 16 : 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
