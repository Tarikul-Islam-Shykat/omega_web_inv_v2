import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:omega_web_inv/admin/user_manage/model/user_all_data.dart';

class UserController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  
  // Observable variables
  var selectedTabIndex = 0.obs;
  var allUsers = <User>[].obs;
  var paidUsers = <User>[].obs;
  var nonPaidUsers = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      selectedTabIndex.value = tabController.index;
    });
    loadDummyData();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void loadDummyData() {
    // Dummy data with ImagePath.profile as placeholder
    List<User> dummyUsers = [
      User(
        id: '1',
        name: 'Wade Warren',
        imagePath: 'ImagePath.profile',
        userType: UserType.paid,
        isPaid: true,
      ),
      User(
        id: '2',
        name: 'Esther Howard',
        imagePath: 'ImagePath.profile',
        userType: UserType.paid,
        isPaid: true,
      ),
      User(
        id: '3',
        name: 'Jenny Wilson',
        imagePath: 'ImagePath.profile',
        userType: UserType.nonPaid,
        isPaid: false,
      ),
      User(
        id: '4',
        name: 'Robert Fox',
        imagePath: 'ImagePath.profile',
        userType: UserType.paid,
        isPaid: true,
      ),
      User(
        id: '5',
        name: 'Jacob Jones',
        imagePath: 'ImagePath.profile',
        userType: UserType.nonPaid,
        isPaid: false,
      ),
      User(
        id: '6',
        name: 'Darlene Robertson',
        imagePath: 'ImagePath.profile',
        userType: UserType.nonPaid,
        isPaid: false,
      ),
      User(
        id: '7',
        name: 'Annette Black',
        imagePath: 'ImagePath.profile',
        userType: UserType.paid,
        isPaid: true,
      ),
    ];

    allUsers.assignAll(dummyUsers);
    paidUsers.assignAll(dummyUsers.where((user) => user.isPaid).toList());
    nonPaidUsers.assignAll(dummyUsers.where((user) => !user.isPaid).toList());
  }

  List<User> getCurrentTabUsers() {
    switch (selectedTabIndex.value) {
      case 0:
        return allUsers;
      case 1:
        return paidUsers;
      case 2:
        return nonPaidUsers;
      default:
        return allUsers;
    }
  }

  int getCurrentTabUserCount() {
    return getCurrentTabUsers().length;
  }

  String getCurrentTabTitle() {
    switch (selectedTabIndex.value) {
      case 0:
        return 'All User';
      case 1:
        return 'Paid User';
      case 2:
        return 'Nonpaid User';
      default:
        return 'All User';
    }
  }

  void onTabChanged(int index) {
    selectedTabIndex.value = index;
    tabController.animateTo(index);
  }

  void sendNotification() {
    // Handle send notification logic
    Get.snackbar(
      'Notification',
      'Notification sent successfully!',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void generateDiscountCode() {
    // Handle generate discount code logic
    Get.snackbar(
      'Discount Code',
      'Discount code generated successfully!',
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
  }
}