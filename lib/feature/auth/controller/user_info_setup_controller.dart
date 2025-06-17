import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../user/home/view/home_screen.dart';


class UserInfoSetupController extends GetxController {
  // Controllers for text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController dietaryPreferenceController =
      TextEditingController();

  // Reactive state variables
  final Rx<File?> selectedImage = Rx<File?>(null);
  final RxBool isLoading = false.obs;
  final RxString selectedGender = ''.obs;
  final RxString selectedFitnessGoal = ''.obs;
  final RxString userName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Update userName whenever nameController changes
    nameController.addListener(
      () => userName.value = nameController.text.trim(),
    );
  }

  Future<void> pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
      }
    } catch (e) {
      _showErrorSnackbar('Failed to pick image', e.toString());
    }
  }

  void setGender(String? value) => selectedGender.value = value ?? '';
  void setFitnessGoal(String? value) => selectedFitnessGoal.value = value ?? '';

  String? validateInputs() {
    if (userName.value.isEmpty) return 'Name is required';

    if (ageController.text.trim().isEmpty) return 'Age is required';
    final age = int.tryParse(ageController.text);
    if (age == null || age <= 0) return 'Enter a valid age';

    if (weightController.text.trim().isEmpty) return 'Weight is required';
    final weight = double.tryParse(weightController.text);
    if (weight == null || weight <= 0) return 'Enter a valid weight';

    if (heightController.text.trim().isEmpty) return 'Height is required';
    final height = double.tryParse(heightController.text);
    if (height == null || height <= 0) return 'Enter a valid height';

    if (selectedGender.value.isEmpty) return 'Gender is required';
    if (selectedFitnessGoal.value.isEmpty) return 'Fitness goal is required';

    return null;
  }

  Future<void> saveProfile() async {
    final error = validateInputs();
    if (error != null) {
      _showErrorSnackbar('Error', error);
      return;
    }

    isLoading.value = true;
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      Get.off(() => HomeContent());
    } catch (e) {
      _showErrorSnackbar('Failed to save profile', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  List<Map<String, dynamic>> getGoalData() {
    return [
      {
        'title': 'Weight',
        'value':
            weightController.text.isEmpty
                ? 'N/A'
                : '${weightController.text} kg',
        'icon': Icons.fitness_center,
      },
      {
        'title': 'Height',
        'value':
            heightController.text.isEmpty
                ? 'N/A'
                : '${heightController.text} cm',
        'icon': Icons.height,
      },
      {
        'title': 'Goal',
        'value':
            selectedFitnessGoal.value.isEmpty
                ? 'N/A'
                : selectedFitnessGoal.value,
        'icon': Icons.flag,
      },
    ];
  }

  void _showErrorSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    ageController.dispose();
    weightController.dispose();
    heightController.dispose();
    dietaryPreferenceController.dispose();
    super.onClose();
  }
}
