import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/User/Views/features/Notification/controller/notification_controller.dart';
import 'package:omega_web_inv/core/global_widegts/custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController controller = Get.put(NotificationController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 90.h),
          child: Column(
            children: [
              CustomAppBar(title: 'Notification', centerTitle: true),
              SizedBox(height: 8.h),

              Container(
                height: 90.h,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF).withAlpha(18),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      'You have received a discount code that gives you 20% off on all plans.\nYour code: 1234',
                      style: TextStyle(
                        color: Color(0xFFF0ECEC),
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.notifications.length,
                  itemBuilder: (context, index) {
                    final notification = controller.notifications[index];
                    return Card(
                      color: Colors.white.withAlpha(18),
                      child: ListTile(
                        leading: Image.asset(
                          notification.profileImage,
                          // height: 66.h,
                          // width: 66.w,
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              notification.senderName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              notification.time,
                              style: TextStyle(
                                color: Color(0xFFA9A9A9),
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          notification.message,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
