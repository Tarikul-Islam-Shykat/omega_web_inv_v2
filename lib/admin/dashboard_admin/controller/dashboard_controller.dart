// dashboard_controller.dart
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class DashboardController extends GetxController {
  // Observable variables
  var profileImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();
  
  // Dashboard data
  final Map<String, dynamic> dashboardData = {
    'Manage Users': 78,
    'Manage Plan': 03,
    'Fitness Goal': 03,
    'Manage Workout': 210,
    'Manage Nutrition': 125,
    'Manage Progress': 78,
    'Trainer Support': 78,
    'Nutritionist Support': 111,
  };

  // Colors for each card
  final List<List<Color>> cardGradients = [
    [Color(0xFF6B46C1), Color(0xFF9333EA)], // Purple - Manage Users
    [Color(0xFF1E40AF), Color(0xFF3B82F6)], // Blue - Manage Plan
    [Color(0xFF7C2D12), Color(0xFFEA580C)], // Orange - Fitness Goal
    [Color(0xFF065F46), Color(0xFF10B981)], // Green - Manage Workout
    [Color(0xFF134E4A), Color(0xFF14B8A6)], // Teal - Manage Nutrition
    [Color(0xFF1F2937), Color(0xFF6B7280)], // Gray - Manage Progress
    [Color(0xFF92400E), Color(0xFFF59E0B)], // Yellow - Trainer Support
    [Color(0xFF1E3A8A), Color(0xFF3B82F6)], // Dark Blue - Nutritionist Support
  ];

  // Pick image from gallery
  Future<void> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );
      
      if (image != null) {
        profileImage.value = File(image.path);
        Get.snackbar(
          'Success',
          'Profile image updated successfully!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    }
  }

  // Handle card tap
  void onCardTap(String title, int value) {
    Get.snackbar(
      title,
      'Tapped on $title with value: $value',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue.withOpacity(0.8),
      colorText: Colors.white,
      duration: Duration(seconds: 2),
    );
    
    // You can add navigation or other logic here
    print('Card tapped: $title - Value: $value');
  }

  // Get gradient for specific index
  List<Color> getGradientForIndex(int index) {
    return cardGradients[index % cardGradients.length];
  }
}